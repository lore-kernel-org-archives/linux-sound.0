Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 830FE3BB699
	for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 19:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784834340; cv=none; b=MPamkM/w6/hKJ/KYHFXIP/Do7MDQLoKyvQFNn++RXxzouHBbciklNt1wemGKksZPhPQUeQZ9gg5C0oRYST9G5X9WdYcF48De/Iz6gtZOKhsw4tBC3DB5RT8V/J514sxpKE1+BF+NmHxslDjRpzPK0Qhl5UlsZcJPwhsJiKJYmpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784834340; c=relaxed/simple;
	bh=62MH3ErigjlRTtTQVAj5oD0cUicYxTuv6jKO7iogfzU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PW3g3ZV45LbbYYK919/LjfGTVen0ILfuZge8MX1C51CARshLwiVY273wV6xXqjoT7uyR3DZjD4YRkZBQjCim0TyXGJ+mppOJoFpZUuZ9JBsSKSj4o0zssrlf0Pw+1GsbO3Bmj1w0z+OvK4dv1pLrZ9GxdB5hCVB7Zwxcv1TTInc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rg+n2qdR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YsiX0/aq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rg+n2qdR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YsiX0/aq"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NImB3I697792
	for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 19:18:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zb/ry0UeGYL5zv8gKcX/rJF/
	g4FlRmPl6+5B6sl8am4=; b=Rg+n2qdRlrji+8eKrEkcLKblsiF29tBmbvoFuEY0
	O8YbrvjNqa68nZzJSSOMWGeeV+5kWr4HLHAOmGRo5sFatVB14xtH65IIz96PsP8V
	rnyrAFFTuyZ7WUSmmLZ85eBgpZHm9c7hgsjwiE2sNOZxUg8XhBb2IOOzZgE5y8Ej
	Gk6NpDlS4UB75CTcCROpfDbolcEl8zjMDt5hCCX2yFG2dlbmRen1ibjB6aF3XCM3
	LcoCvMS7n+cKv8NlG3xTKQp4aGpY/kidtF+j3Zd5Ju8/tKZYDeL/Mbhdcuhjqwwu
	l4YyyxztXeR9AMFuPvcCev0uEknQniEqRoOcz/eutt28LA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkg522mh9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 19:18:54 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1d7886cdso26117061cf.1
        for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 12:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784834334; x=1785439134; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zb/ry0UeGYL5zv8gKcX/rJF/g4FlRmPl6+5B6sl8am4=;
        b=YsiX0/aqGlVzAJROBoSepu82BOssR11ETWAqpkoiC8YR3+TGNn7kY3eTf51DRJ0O2N
         Rb4P5L7kw/euvJJXm8Fnjn/ImMafnjEA2zL/GO1ipI9czOtztSwYbzYoYWLye27u5lYJ
         stQv6H4azhSQQwkUakrSnSoZvan5rOkaJLXR0B8Ia7/AA+Wr3ym22pBN6CC3zD5fwAiK
         XVikpQ7FtrACyaGPiTuO+tXTk7ENGIoXNvpes9ZPCr7wPzR1CsMTaqU+MPz1pQv6n1wD
         UulvVgZaUlm5G8Nj06i0uC30gH68zannwSPDVosBCIv7LXPuiiODthO+3NRZo1r5B3gH
         ZxQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784834334; x=1785439134;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zb/ry0UeGYL5zv8gKcX/rJF/g4FlRmPl6+5B6sl8am4=;
        b=lFjcbRbIVUcOz820y0/OJk4Ij6KXi+CxQNsktJwGrc4j6T1tTqGKHRP8qAQphb0yMO
         lY5RngN97awC2EERgyX2SNE2OrrgVN/e1dzEfeJ+nafSVU17ifISevAn5jOuHe2/rXQQ
         AkDTHbcaqvrTEhCEGqQWJsGLNc5SuSvMCGMG0ri7/PImd8b7iQo0u74VVyMvC2Qir5qu
         CwkHZfyqiIOgZ+lzOZ2EWt1UfgTkuWDlx76Q4oHFLgPR8ZwvpjfeXpGSUyroAG4RyY0t
         ViKzgXGQhHxYJR3tIsubLRM8XEPq7rTa9Cnm/imWsuVJVBCNCgVr2dl6WdTwgmU3G77L
         mRmQ==
X-Forwarded-Encrypted: i=1; AHgh+RrDYUQ1nKB7hL7yd2eAE8xv8xNLxQLPWJbJBuKF7RTf2b2m1zfcC45BLIJc+507AwLSRphZHsAv4fZQ9A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzlFuEczJYJLQxDi+A8L1v+KGxramnqt28oqNgwXpmxIEK6iNP0
	+naTEd6R/nb4vfERQp+UIN3hZBRJkKalz+0szl8OkoVTJiBR5JWIdFvxrlWCVhCMkzeEc8l8rRQ
	lKZx0l5+W8qsluz8BHffVZMCDVjAIQmH5JWPy9m+WidWd23OWUe2QXJyXmTtcE9/21g==
X-Gm-Gg: AR+sD10vyUe2VAw+vsWonvBwOek0K9wrJU/mi6hnBSAzIs6oeRRutHuoW7I0l6dRjOh
	HPs+qPXs4R1XblPVqmKa/+njnlhPYCYzfojc3h9QIE76VGI2CH9K3nKJ8D9RtvsIjJCEne5mK5w
	elSrgB0eB0vOFViYQOToP77US1fVIFoJHQh2twBYFIp+HuUklRk0aEsW7ue1hqzobLfNxNTGzh/
	8n1nm7bkp32Yt6qzuhyufaw7MjIP07XaPAXnOgCHq5rgAb/Rn5FnajCQsx5VfT4hmSih7Sm/++r
	htXm2lnep/cvGcfdSfKAzzNJ7MjOXwAj1sagZkomn1jhGyiOyjUzvIFLcJIrBRzgHjHJwvoBwNk
	P4mRzjgqWzqD0vLViqnJ21sp2unKGY9fFAe4IUQcXNbxtpEpWyY8e+F5PFrMxQz9VTHHI3MEI7n
	HnBlaeL6SiBgiUYg==
X-Received: by 2002:ac8:5c83:0:b0:517:9f43:4732 with SMTP id d75a77b69052e-5283ddd1608mr44395401cf.11.1784834333277;
        Thu, 23 Jul 2026 12:18:53 -0700 (PDT)
X-Received: by 2002:ac8:5c83:0:b0:517:9f43:4732 with SMTP id d75a77b69052e-5283ddd1608mr44394791cf.11.1784834332367;
        Thu, 23 Jul 2026 12:18:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9e44b97sm1155545e87.61.2026.07.23.12.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 12:18:51 -0700 (PDT)
Date: Thu, 23 Jul 2026 22:18:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] ASoC: qcom: remove ipq806x Storm machine driver
Message-ID: <5o4nyr5iycpgopeo5dllygtndbp24g5ejqvh43d3mxwnxufork@zds6b6aqvcqf>
References: <20260721-drop-sound-storm-v1-0-23ae4a689ffe@oss.qualcomm.com>
 <20260721-drop-sound-storm-v1-1-23ae4a689ffe@oss.qualcomm.com>
 <85f2799d-fadf-478d-9f3f-fb8ff91ba84d@oss.qualcomm.com>
 <6a609d87.87c5160c.1accad.0f33@mx.google.com>
 <CAO9ioeUw4QgW47xmC58dGc1_j2UPFjDM+dDRF-bggpBPFA32YQ@mail.gmail.com>
 <6a625f94.4d70c427.b2b96.9b5b@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a625f94.4d70c427.b2b96.9b5b@mx.google.com>
X-Authority-Analysis: v=2.4 cv=DtZmPm/+ c=1 sm=1 tr=0 ts=6a62691e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=pgCZHW_WQO5PacoC4eoA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDE4OCBTYWx0ZWRfX/6N7Mqha3xYT
 WlIWb3W0wEGtMdpW6agBk+0wZZaR+Kh5uL/0SqWTus9shksOjQG9EI0n4T3vCfaCM18d/aQZTca
 G7CcY01NECEpXjMEHZwfYx99BD9UHu0=
X-Proofpoint-GUID: raKmB9-Co2MHGSQW4U__ZtTs1yMgRFXj
X-Proofpoint-ORIG-GUID: raKmB9-Co2MHGSQW4U__ZtTs1yMgRFXj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDE4OCBTYWx0ZWRfX4907kSrN3+Jv
 5+YG1/sg9f3nJa67Ylvd4YeC3Me2G88FlTrN3DNp4ZljBJ/old+naq/GbFBj8mpcC1UzcMb9iBE
 jkRcmYGmipWrJly0s1J0YXDCY0EVMOlwSZfaiLIqn5D+z1Z9wdobbndAiy/q6lCJVuSW3qAim1h
 lUeYxah8pxzRBZpcLUl69iQBqdL+1DzF6xBJLzUuxLpNUg49DDI5TMhuGgTMqAD/qV+qudl/JYD
 QOA2K0GEZQj7aXuHmp30iuK4Ecu0DqJa40rheHVFAibsoJu7qdzpsiSjNRsbi0mOjzeWj0DMTd7
 exEQYvvVx7o1/zP0rgvCk4ewGRvxNkbYf1a0JiYju1+3vf3Jd5wmtAKVW+QjX66cirzpsQyrfcw
 QH6fL5Uckp9oCQ0YQ2vEJ47z4Fuixo2xY16APKbCGi9p/TgOPD3je103gXg4bSVNK9VHnQ5qn5u
 XQUSG/25z1C7JKk6B6Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_06,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230188

On Thu, Jul 23, 2026 at 08:38:09PM +0200, Christian Marangi wrote:
> On Wed, Jul 22, 2026 at 01:48:30PM +0300, Dmitry Baryshkov wrote:
> > On Wed, 22 Jul 2026 at 13:38, Christian Marangi <ansuelsmth@gmail.com> wrote:
> > >
> > > On Wed, Jul 22, 2026 at 10:00:34AM +0200, Konrad Dybcio wrote:
> > > > On 7/21/26 8:12 PM, Dmitry Baryshkov wrote:
> > > > > The Storm board machine driver targets Google's IPQ806x-based Storm
> > > > > reference board (a MAX98357A DAC wired to the LPASS I2S bus). This board
> > > > > has no upstream device tree, no active users and has seen no functional
> > > > > changes in years, so the driver is dead weight.
> > > > >
> > > > > Remove the driver together with its Kconfig entry and Makefile rule.
> > > > >
> > > > > Assisted-by: Claude:claude-opus-4-8
> > > >
> > > > Using AI to `git rm` is definitely tokenmaxxing!
> > > >
> > > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > > > ---
> > > >
> > > > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > > >
> > >
> > > Honestly I'm pretty angry about the latest changes on ipq806x. First the
> > > dtsi just because there weren't device (it's ok and understandable) now we
> > > are starting to remove driver...
> > >
> > > There are godzillion situation where there is a driver but absolutely no
> > > dtsi. Lets remove the dwmac driver, usb phy, pcie and everything else at
> > > this point and treat this soc like it's a 80-90 code...
> > >
> > > I will post dtsi with actual device for the SoC but really I'm not
> > > following all this hurry in cleaning code for device that still gets used
> > > and actually some company even produced new one (even if it's EOL)
> > 
> > We have no way to check that the device is being used other than the
> > DTSI present in the kernel, being updated from time to time with
> > non-trivial changes.
> > 
> > For the patchset in question, do you (or the community) actually use
> > OnHub? If so, please consider upstreaming DT files (and also updating
> > schema FWIW).
> > If not, the files will eventually go away. Just having unused drivers
> > _adds_ a burden. I stumbled upon the driver while reviewing a patch
> > changing the driver (for the sake of changing the ASoC API).
> > 
> > And FWIW the series doesn't touch the IPQ806x LPASS driver (which has
> > a DT counterpart).
> > 
> 
> Yes on OpenWrt we support 3 OnHub google devices from Asus and Tplink and
> they also use the storm driver for the strange attached speaker.

Ack. Then pretty please, could the OpenWrt community please contribute
those to the mainline. It is a quest and a process, but it helps us to
understand actual hardware users.  Not to mention that getting platforms
support upstream would lower the burden of rebasing on the new upstream
kernels (assuming that you are using close-to-upstream kernel) and it
would also save from similar cleanup attempts.

-- 
With best wishes
Dmitry
