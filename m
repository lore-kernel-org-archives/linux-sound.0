Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63433750C4
	for <linux-sound@vger.kernel.org>; Fri, 12 Jun 2026 08:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781252600; cv=none; b=Zx4qaHSdNM8dQQqQ9IQa1Mid3kWX/WFuiDUfkDT+wXuqfLJKsjFqZ4MFvsruC+y8Kzl0uev49gL3oqoVc/sAl4+Bds9IYTKdnpe3Se1rDIAWc9cHUD5netn+TQFktIzvm2hvMg1s2xY6EsKSGtQkvCAkt+Rn6/N7BZUz8JJx0EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781252600; c=relaxed/simple;
	bh=/Mo39LbuWvRhC9Hu0sdWS9GvhB+uezotcg/aCka+N3k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jxyjFneKlvGyM/0B9VizCftBDJpraRhO/6dpQZaQ6S0+5kdnpnyk1/vMI3nPzgJ6wTz3wCMQ5bLp053fP/3qtZQvQadqV5UAXcwXPyYjvgIsNMDYzJevCZtyEGuLS3E3YAMaSImHItwjKuHty/afvBaqbhKYplMtS8quDTSXkRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ahj9TDTG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SU9NCr3C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ahj9TDTG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SU9NCr3C"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C3Btlp2451851
	for <linux-sound@vger.kernel.org>; Fri, 12 Jun 2026 08:23:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9l+5o1r9S2xr00C2d7XO//P1
	yNID3+8R7CIuRwo4Aek=; b=ahj9TDTGVJV2NF+QoThvq+WdEYD7FRyB8Am7FKmz
	PFSCcQis8F+vYvEw0kvxJq4zn5bMg9GkQN7F43dbhPqXAS6NIzk/4X3b2x+BMiLQ
	xl4a6Y9RWsrfDAFfFhtCTe3aJeG819fsifCVlkJxcve3R23PBHSF5ymui4WD0FCN
	e4sR7BYGUdcbOFtWbbqWudT/g8veev394F0ecXG/hucQOrq5J2T8r7YNmF7jKiSw
	gQSjMM0K5ntME41jL2YIegjPmOvXtuDZMU3wQ1HjHppVUbTVpA6+b8i19IkQZRwU
	khwkfKu9vwDRmBHl2NB6PJUUynSNwB+ItXltpj8PmBnqKg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er1xcjg0b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 12 Jun 2026 08:23:16 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5175bf22b1bso8796261cf.3
        for <linux-sound@vger.kernel.org>; Fri, 12 Jun 2026 01:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781252596; x=1781857396; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9l+5o1r9S2xr00C2d7XO//P1yNID3+8R7CIuRwo4Aek=;
        b=SU9NCr3C6W5S3PlXTaSix8fLvf5c/EcNbusrOlKhPSxZQOTWMuISz4ltRFipjnaMon
         0vzDqfn8ucb7QaG7mur6ERwWlDGWWmlFISRoXSjgS9rRfkVS4ikFFdo7Fkp5+6i79Hn0
         IpfIdOQ9ZIfWJ4VF83eUf0Jjxig/D6YCZuhAOtMMpN+rVqlgPgOG877Suz6clCrmBXU4
         4A02b8eoX7RYTj2aYDA1iRtxIhlKEtO3arn7BNar8dYfCWp9h5l3Xm7wcNVaOaiSQeZz
         ezqypZkLOfNnJ7lF2qz8FjOA8tDSDpwK+4fgld4uijBc+Em/nKkVJh8yuM/v1/Ar5X3t
         huXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781252596; x=1781857396;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9l+5o1r9S2xr00C2d7XO//P1yNID3+8R7CIuRwo4Aek=;
        b=fORKyNxbvfLX2jIdKGuEjupGKcBodGtEmV2DGNlUNENvjo9xB6y/sFolyRZaZBviOB
         cv6p0Dad166/4ZLYVo6NjY+dzE6TRl7YkNb5Usq2MbEezyMmCm+NXjjlA6NDCncTTAeu
         xCi3qtQMm527DJAwXm/6SGiPJfaARlP/CmO9FRefzLiDNZFDERt1YL7foquq4upM//2E
         WPAxyTanwwxsYDLQm+8kWUKRTXY8BOpGIL3xZkjzeMC1UBXKL2abnYPr34VL4L3J6FWU
         AQN1nZLvhW8WRqekhP/zfzDEh57Otqald6YyvUQzq7FYxec1sr7aBCp2T/nDteN693DK
         d1Nw==
X-Forwarded-Encrypted: i=1; AFNElJ9gco1ZThIL82wVDSlIFsOh9z57QRuH6Kp0BczBWPSY4Nolyh9mmwyo4+K1RIuY7sxgq2TmG+cRNOxZhA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxiwHZpDjO7BbUsfNVyOSSVwsTk1wSSu1HyoulUbnUJwjqbQcux
	+/E1CucqvCfMzWoHFbjyDxsZUaUKW99PHxp3uR6S1I4VOuQAOe5Ch+ISWlb6bREsqdoWCu4uib1
	nKrGyyQ4b4uzFU2plCy1W+qZaE07OdrMIwce9yJLx8lGI6yooLQxRP/FRhfLx23T4Tw==
X-Gm-Gg: Acq92OHplF2lZe+C8VhvVBwgonTyS8wlpzCWrLvegbtRov2OjEV6J46iM7hWbor/bon
	NIPpk6FgeUWZjDAwFborSlEnxlYM21oH84wFSmGjxuOFPN/TGjeZZ6oyYWvD4qz0Cs4S9hW0Smr
	DCMLHHDukD7bUrEWDfTvGhRrxiEQ2UIAeb54af7pS9sGjVUBqMSHcfxoDRoaDKXbthzJAwSyvpj
	4yARugIghWV8wjQiwPZk3JYtR7c1128w4/909HrS+88RYxnLo2v6Xj+rZuGxlbKu62PE/QDcPNp
	c5+SMxU1EgjfTuuB9ogtT3cgHudQMWUzW+jKWarCT5TAtU8CtzjJoB9b3QTDBR+gmyoFb1sJDqn
	rOGQ/80eJqpsTF3f5EhSKLKcgJXd70KbWtWTAVlKm3PYmOvnbmIzk2fdhfCWKbBqbFNph4q8suN
	z7c+NNIpbC+b9mHQdwtqXyItD6uxPoGulFSaU=
X-Received: by 2002:a05:622a:24b:b0:517:87bc:9b47 with SMTP id d75a77b69052e-517fe4eee29mr20587851cf.39.1781252595929;
        Fri, 12 Jun 2026 01:23:15 -0700 (PDT)
X-Received: by 2002:a05:622a:24b:b0:517:87bc:9b47 with SMTP id d75a77b69052e-517fe4eee29mr20587561cf.39.1781252595548;
        Fri, 12 Jun 2026 01:23:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e16a063sm340215e87.26.2026.06.12.01.23.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 01:23:14 -0700 (PDT)
Date: Fri, 12 Jun 2026 11:23:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, kancy2333@outlook.com,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sm8650-ayaneo-pocket-s2: switch
 sound card to ayaneo,pocket-s2-sndcard
Message-ID: <lm3yngkad2wcw3bfjcsfsmucsekmulhov4c7oygtp3e4f54fhl@lgj7gidpma57>
References: <20260610-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v1-0-18bb19c5ca22@linaro.org>
 <20260610-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v1-3-18bb19c5ca22@linaro.org>
 <tkgqorjdnvwcx4ddgi5m7j3g6wlawxnm5ugty6y33ftwxzbvv5@uxcai2sgglfs>
 <e7e6d38b-6d80-4c75-bfbf-eef49589ddbe@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e7e6d38b-6d80-4c75-bfbf-eef49589ddbe@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA3NSBTYWx0ZWRfX3McjEbcaqKRa
 8EAx69cJn//drMjmHj3YXOGiyoW3/5yOsdkYaTADhjkwQavCZz3wLkatBITYqmaMl74ezcnG2Ah
 EaJSYqFgXRnEuxe8EGUiLrf1Apg+iKt9ZEUvGYUKX4OYDx2oy9BRvI6pHZxxnHww47NOWsj2IXs
 0sw1K9+IeG7M9YBIC6DyknqFQbuxUH9T88pV55nfwSzmL/GkVcRyItjJUrjw5QLJhSbpwopHNwn
 5097Q4A5Q2KLHBwl8L+AllrTd5e7/C8VgO+EqSxJdM45k7gChBgt1b3I9+dbonpqS9A5dc+6y9G
 TohpOJOKUqTdqEdKW7fMET5UQwzEWwFLonwf1EKezz/jQvgmdETfBy9AIp+a4gWczrcSEV22j8r
 pt3M6uWrWmdkCutc8WNgTZGwSn4/rAvfwnPwr41sXd/na7USH7DQcV8e/BM9GZPCZQiFtt4lZpo
 NYasyh/lc8LkocivrKA==
X-Proofpoint-GUID: Zixrj8X_xK2bWiDRgn4iw6jzVWXqg79K
X-Proofpoint-ORIG-GUID: Zixrj8X_xK2bWiDRgn4iw6jzVWXqg79K
X-Authority-Analysis: v=2.4 cv=NZPWEWD4 c=1 sm=1 tr=0 ts=6a2bc1f4 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=MC-EAa16RIyZf_4PNl8A:9
 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA3NSBTYWx0ZWRfX8fCpukqDRz7U
 pWS/L8GFMTHlP28Ki1hbjYz2V4Pyb/CCIsYa0ttRSc2/y+pYW28cDBfHUq/KwEhdfY3vIZcPcAv
 5fkzPkmog2ldLhMISIe8EfJ+nRZGu98=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120075

On Fri, Jun 12, 2026 at 09:59:02AM +0200, Neil Armstrong wrote:
> On 6/12/26 09:57, Dmitry Baryshkov wrote:
> > On Wed, Jun 10, 2026 at 09:41:47AM +0200, Neil Armstrong wrote:
> > > Switch to the ayaneo,pocket-s2-sndcard since the hardware layout
> > > is incompatible with the default SM8650 generic sound card.
> > 
> > Incompatible, how?
> 
> As explained on the cover letter, the WAS speakers are not connected
> on the same lines as the other devices handled by this card.

The cover letter isn't recorded in the Git history. Somebody looking at
the commit in a year should not have to look in the mail archive to
understand what is incompatible.


-- 
With best wishes
Dmitry
