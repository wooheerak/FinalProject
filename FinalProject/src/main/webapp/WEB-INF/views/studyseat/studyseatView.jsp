<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>열람실 좌석 조회</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>

<body>

	<c:import url="../common/header.jsp"></c:import>

	<section class="section normalhead lb">
		<div class="container">
			<div class="row">
				<div class="col-md-10 col-md-offset-1 col-sm-12 text-center">
					<h2>
						<strong>열람실</strong>조회
					</h2>
					<p class="lead">잠은 죽어서 자자...</p>
				</div>
				<!-- end col -->
			</div>
			<!-- end row -->
		</div>
		<!-- end container -->
	</section>
	<!-- end section -->

	<section class="section bt overfree" style="padding: 40px 0px;">
		<div class="icon-center">
			<i class="fa fa-anchor"></i>
		</div>
		<div class="container">
			<div class="section-title text-center">
				<small>KH 대학교 도서관에 오신걸 환영합니다</small>
				<h3>열람실 좌석 조회페이지</h3>
				<hr>
			</div>
			<!-- end section-title -->
		</div>
		<!-- end container -->
	</section>
	<!-- end section -->

	<section class="section bt" style="padding: 30px 0px;">
		<div class="container">
			<div class="row">
				<div class="col-md-9 " style="height: 700px; display: inline;">
					<div class="service-box"
						style="height: 700px; border: 1px solid lightgray; border-radius: 4px;">
						<div class="row window">
							<p style="margin-top: 10px; font-size: large;">창&nbsp;&nbsp;&nbsp;문</p>
						</div>
						<div class="row"
							style="margin-left: 10px; margin-right: 10px; margin-top: 5px;">
							<div class="seatCharts-row" style="display: inline;">
								<div id="s1" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">1</div>
								<div id="s2" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell unavailable">2</div>
								<div id="s3" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">3</div>
								<div id="s4" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">4</div>
								<div id="s5" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">5</div>
								<div id="s6" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">6</div>
								<div id="s7" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">7</div>
								<div id="s8" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">8</div>
								<div id="s9" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">9</div>
								<div id="s10" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">10</div>
							</div>
							<div class="seatCharts-row"
								style="float: right; display: inline;">
								<div id="s61" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">61</div>
								<div id="s62" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell unavailable">62</div>
								<div id="s63" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">63</div>
								<div id="s64" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">64</div>
								<div id="s65" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">65</div>
								<div id="s66" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">66</div>
								<div id="s67" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">67</div>
								<div id="s68" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">68</div>
								<div id="s69" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">69</div>
								<div id="s70" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">70</div>
							</div>
						</div>

						<div class="row" style="margin-left: 10px; margin-right: 10px;">
							<div class="seatCharts-row" style="display: inline;">
								<div id="s11" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">11</div>
								<div id="s12" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell unavailable">12</div>
								<div id="s13" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">13</div>
								<div id="s14" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">14</div>
								<div id="s15" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">15</div>
								<div id="s16" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">16</div>
								<div id="s17" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">17</div>
								<div id="s18" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">18</div>
								<div id="s19" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">19</div>
								<div id="s20" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">20</div>
							</div>
							<div class="seatCharts-row"
								style="float: right; display: inline;">
								<div id="s71" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">71</div>
								<div id="s72" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell unavailable">72</div>
								<div id="s73" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">73</div>
								<div id="s74" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">74</div>
								<div id="s75" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">75</div>
								<div id="s76" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">76</div>
								<div id="s77" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">77</div>
								<div id="s78" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">78</div>
								<div id="s79" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">79</div>
								<div id="s80" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">80</div>
							</div>
						</div>

						<br> <br>

						<div class="row" style="margin-left: 10px; margin-right: 10px;">
							<div class="seatCharts-row" style="display: inline;">
								<div id="s21" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">21</div>
								<div id="s22" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell unavailable">22</div>
								<div id="s23" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">23</div>
								<div id="s24" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">24</div>
								<div id="s25" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">25</div>
								<div id="s26" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">26</div>
								<div id="s27" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">27</div>
								<div id="s28" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">28</div>
								<div id="s29" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">29</div>
								<div id="s30" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">30</div>
							</div>
							<div class="seatCharts-row"
								style="float: right; display: inline;">
								<div id="s81" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">81</div>
								<div id="s82" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell unavailable">82</div>
								<div id="s83" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">83</div>
								<div id="s84" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">84</div>
								<div id="s85" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">85</div>
								<div id="s86" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">86</div>
								<div id="s87" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">87</div>
								<div id="s88" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">88</div>
								<div id="s89" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">89</div>
								<div id="s90" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">90</div>
							</div>
						</div>

						<div class="row" style="margin-left: 10px; margin-right: 10px;">
							<div class="seatCharts-row" style="display: inline;">
								<div id="s31" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">31</div>
								<div id="s32" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell unavailable">32</div>
								<div id="s33" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">33</div>
								<div id="s34" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">34</div>
								<div id="s35" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">35</div>
								<div id="s36" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">36</div>
								<div id="s37" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">37</div>
								<div id="s38" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">38</div>
								<div id="s39" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">39</div>
								<div id="s40" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">40</div>
							</div>
							<div class="seatCharts-row"
								style="float: right; display: inline;">
								<div id="s91" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">91</div>
								<div id="s92" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">92</div>
								<div id="s93" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">93</div>
								<div id="s94" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">94</div>
								<div id="s95" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">95</div>
								<div id="s96" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell unavailable">96</div>
								<div id="s97" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">97</div>
								<div id="s98" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">98</div>
								<div id="s99" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">99</div>
								<div id="s100" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">100</div>
							</div>
						</div>

						<br> <br>

						<div class="row" style="margin-left: 10px; margin-right: 10px;">
							<div class="seatCharts-row" style="display: inline;">
								<div id="s41" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">41</div>
								<div id="s42" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">42</div>
								<div id="s43" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">43</div>
								<div id="s44" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">44</div>
								<div id="s45" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">45</div>
								<div id="s46" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">46</div>
								<div id="s47" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell unavailable">47</div>
								<div id="s48" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">48</div>
								<div id="s49" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">49</div>
								<div id="s50" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">50</div>
							</div>
							<div class="seatCharts-row"
								style="float: right; display: inline;">
								<div id="s101" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">101</div>
								<div id="s102" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">102</div>
								<div id="s103" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">103</div>
								<div id="s104" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">104</div>
								<div id="s105" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">105</div>
								<div id="s106" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">106</div>
								<div id="s107" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">107</div>
								<div id="s108" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">108</div>
								<div id="s109" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">109</div>
								<div id="s110" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell unavailable">110</div>
							</div>
						</div>

						<div class="row" style="margin-left: 10px; margin-right: 10px;">
							<div class="seatCharts-row" style="display: inline;">
								<div id="s51" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">51</div>
								<div id="s52" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">52</div>
								<div id="s53" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">53</div>
								<div id="s54" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell unavailable">54</div>
								<div id="s55" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">55</div>
								<div id="s56" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">56</div>
								<div id="s57" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">57</div>
								<div id="s58" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">58</div>
								<div id="s59" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">59</div>
								<div id="s60" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">60</div>
							</div>
							<div class="seatCharts-row"
								style="float: right; display: inline;">
								<div id="s111" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell unavailable">111</div>
								<div id="s112" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">112</div>
								<div id="s113" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">113</div>
								<div id="s114" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">114</div>
								<div id="s115" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">115</div>
								<div id="s116" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">116</div>
								<div id="s117" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">117</div>
								<div id="s118" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">118</div>
								<div id="s119" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">119</div>
								<div id="s120" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">120</div>
							</div>
						</div>

						<br> <br>

						<div class="row" style="margin-left: 10px; margin-right: 10px;">
							<div class="seatCharts-row" style="display: inline;">
								<div id="s61" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">61</div>
								<div id="s62" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell unavailable">62</div>
								<div id="s63" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">63</div>
								<div id="s64" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">64</div>
								<div id="s65" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">65</div>
								<div id="s66" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">66</div>
								<div id="s67" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">67</div>
								<div id="s68" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">68</div>
								<div id="s69" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">69</div>
								<div id="s70" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">70</div>
							</div>
							<div class="seatCharts-row"
								style="float: right; display: inline;">
								<div id="s121" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">121</div>
								<div id="s122" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">122</div>
								<div id="s123" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">123</div>
								<div id="s124" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">124</div>
								<div id="s125" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">125</div>
								<div id="s126" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">126</div>
								<div id="s127" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell unavailable">127</div>
								<div id="s128" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">128</div>
								<div id="s129" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">129</div>
								<div id="s130" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">130</div>
							</div>
						</div>
						<div class="row" style="margin-left: 10px; margin-right: 10px;">
							<div class="seatCharts-row" style="display: inline;">
								<div id="s71" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">71</div>
								<div id="s72" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">72</div>
								<div id="s73" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell unavailable">73</div>
								<div id="s74" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">74</div>
								<div id="s75" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">75</div>
								<div id="s76" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">76</div>
								<div id="s77" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">77</div>
								<div id="s78" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">78</div>
								<div id="s79" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">79</div>
								<div id="s80" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">80</div>
							</div>
							<div class="seatCharts-row"
								style="float: right; display: inline;">
								<div id="s131" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">131</div>
								<div id="s132" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">132</div>
								<div id="s133" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">133</div>
								<div id="s134" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">134</div>
								<div id="s135" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">135</div>
								<div id="s136" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">136</div>
								<div id="s137" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">137</div>
								<div id="s138" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell unavailable">138</div>
								<div id="s139" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">139</div>
								<div id="s140" role="checkbox" onclick="clickSeat(this);"
									aria-checked="false" focusable="true" tabindex="-1"
									class="seatCharts-seat seatCharts-cell available">140</div>
							</div>
						</div>


						<div class="row door">
							<p style="margin-top: 10px; font-size: large;">출&nbsp;&nbsp;입&nbsp;&nbsp;문</p>
						</div>
					</div>
					<br>
				</div>


				<div class="col-md-3 col-sm-6" style="display: inline;">
					<form class="quoteform"
						style="border: 1px solid gray; border-radius: 4px;">
						<div class="pricing-header sixch">
							<b><p id="floor"
									style="font-size: 35px; color: white; display: inline;">A</p></b> <small
								style="color: white; display: inline;">열람실</small>
						</div>
						<br>
						<div class="service-box"
							style="border: 1px solid lightgray; height: 380px;">
							<div class="service-box room" focusable="true"
								style="text-align: center; cursor: pointer;" value="A">
								<b>A열람실</b> <br>
								<p id="a-floor" style="display: inline;">130</p>
								석/140석
							</div>
							<div class="service-box room" focusable="true"
								style="text-align: center; cursor: pointer;" value="B">
								<b>B열람실</b> <br>
								<p id="b-floor" style="display: inline;">65</p>
								석/70석
							</div>
							<div class="service-box room" focusable="true"
								style="text-align: center; cursor: pointer;" value="C">
								<b>C열람실</b> <br>
								<p id="c-floor" style="display: inline;">75</p>
								석/80석
							</div>
						</div>
						<div class="service-box"
							style="border: 1px solid lightgray; text-align: center;">
							<p style="display: inline;">좌석번호 :</p>
							<p id="seatNo" style="display: inline;"></p>
							번
							
						</div>
						<button type="button" class="btn btn-primary btn-block reset"
							style="width: 100px; padding-left: 4px; display: inline; margin-left: 3px; border-radius: 0px;">좌석
							다시 선택</button>
						<button type="button" class="btn btn-primary btn-block" onclick = "resvSeat();"
							style="width: 100px; display: inline; margin-top: 0px; margin-left: 10px; padding-left: 35px; border-radius: 0px;">예약</button>
					</form>
				</div>
			</div>
			<!-- end col -->
		</div>
		<!-- end row -->
	</section>
	<!-- end section -->
	<script>
		var seatId = "";
		var seatNo = 0;
		var check = 0;

		function clickSeat(obj) {
			if (check == 0) {
				if ($(obj).hasClass('available')) {
					console.log("available");
					seatNo = Number($(obj).text());
					seatId = "#" + $(obj).attr("id");
					console.log(seatId);
					$("#seatNo").text(seatNo);
					$(obj).removeClass("available");
					$(obj).addClass("selected");
					check = 1;

				} else if ($(obj).hasClass('selected')) {
					console.log("selected");

					$(obj).removeClass("selected");
					$(obj).addClass("available");
					check = 0;

				} else {
					console.log("unavailable");
				}
			} else {
				if (seatNo == Number($(obj).text())) {
					$(obj).removeClass("selected");
					$(obj).addClass("available");
					$("#seatNo").text("");

					check = 0;
				}

			}

		}

		$(".reset").on("click", function() {
			console.log(seatId);
			$("#seatNo").text("");
			$(seatId).removeClass("selected");
			$(seatId).addClass("available");

			check = 0;
			seatId = "";
		});

		$(".room").on("click", function() {
			$("#floor").text($(this).attr("value"));
		});
		
		function resvSeat(){
			
		}
	</script>

	<jsp:include page="../common/footer.jsp" />

</body>

</html>