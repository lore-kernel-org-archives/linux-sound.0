Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D2040A953
	for <linux-sound@vger.kernel.org>; Mon,  6 Jul 2026 13:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783343819; cv=none; b=VfHMAoDtLMmAba5eMyHbcOL8PjBhogO7D+NhduatVjxrOKvmr16cKEpT0df5HdEdcGUJQD9GPusmBSZrF4xgMi1XyNC6cxbx42loDxcbU/wyVjObAWLLa/SK5mnPtnE6X2kvjOOtFoClqBKuhNuDdy5FWHbd78KPnpz5S5LtX88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783343819; c=relaxed/simple;
	bh=osYfKtMdqTMsFlJUTP73i98DkAo9zxWqgwDdKf3SxAo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YyPQqpQF82dgdwfr85++WUdD9qikJzYS/GdiBG7kZ4hsHjQzxr5C5d95m6kE628G2Iw5+oyPsGKRb4CtUaTpoHkkUKG/nZ/Z25ETJyn2rACTj2DQebbgJV/220cYwrJT3OGbZkqgHEfQaMdiAYBZ+xgDlxCE1bskda2fmt9lGuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gxURCHyC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PSLydRiK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gxURCHyC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PSLydRiK"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxH7T174785
	for <linux-sound@vger.kernel.org>; Mon, 6 Jul 2026 13:16:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Vz86zd3go04za6BKCrEOJJ5A
	QbsnL3kIqNm4xRq1ahk=; b=gxURCHyC5Uby2DEF/Sz+/5yNg3sVS5RYamD/XHiq
	Oeg+y1LJwkhEFbOaeUT/NQGKPdVK2zZ8VlG3hv6H4S/me/nezIWTxoEm9In3Bs8g
	ZvdBIq0+/gprmciBEXPztT6Da/pNCqKAPXP77qtywx46VRNq9dIbfHagzvAaAEIl
	E6hG0pwACBSPp2ODRqZ5jgVnHaYTwWXW8Uuan0qZj5WO8InmLPD6We8EBKixryDx
	iPil71OMzHER33szNYpl62CNRKnWkJ2P7UpjNxjXjQ3Ou5rCnNsvVYC1bhpBPa1w
	4pcAqdWpoDmeLyJqbgihNBYMa0DBssjFzMUnNnE2Yj0Udg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87rxsdx0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 06 Jul 2026 13:16:55 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-380a638fb5bso3061793a91.0
        for <linux-sound@vger.kernel.org>; Mon, 06 Jul 2026 06:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783343815; x=1783948615; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Vz86zd3go04za6BKCrEOJJ5AQbsnL3kIqNm4xRq1ahk=;
        b=PSLydRiK2CDkWpT4WyX5bNVjKC0Is9+e0DgSPd47JnLRGDbMCaFeSwtvH6e4S7HXQ4
         L2ctbF95R+K8dxA85tqd2kIkO+vq9dSsx5MkkFH48eGdJH2CYJX4oD6RskkwmTxHmeOL
         BTH/bd8IPVyLaFLlidF8lufbYjdP7IaMSkcUZB4u4tO5ZgJPUjxDtA4HbhNI90523H7B
         YWne1O2XGxsZF9D7FtQHbU0qDGXg6YN3n4h219/POtajnqIeshFrWxMPk/cTZC8chVA3
         x2otchr6MFAblBuP3TbW4YeP6XfWCth5L32Hg7asZ/HXvZCp09pfzPZz5U9cbvBnk5G/
         wIMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783343815; x=1783948615;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vz86zd3go04za6BKCrEOJJ5AQbsnL3kIqNm4xRq1ahk=;
        b=a61iKiH0zEeQiU+UkmuuwmphlWvaxbMHsoUMrWPu65vhIhN+rhU+gzfV+2zLfFaaQP
         lsJYW0098JHUVxvuKRxcHajZ+ER2kaQzqEoJ2bXIqLiSRN1us25cEpvjdkhlBHSMBMCq
         0WdS8cQ4tOObDSed5Wx4ZJD+Jb0X7Vu8+XgbRSxoPVwZ7kVGmfLVx1CPOxQOWki7PhgM
         yPqzn54knCs4ZJNvuFFYkcZqPqxYMnhocdMI0GhfLo/Gcbg6+EA9t23AWJxR9Ad7oa5p
         Hu2xbRX6YvN7niapv8ERPNoOhsSt+aMQ/ZX5t/JESCmb/O9Hs6N3IJCb8elXNWLpSraA
         ciBg==
X-Forwarded-Encrypted: i=1; AHgh+Rqs/Xp3INQj1Z9TW4m7SZAk2RMn4fLYKWQO6hYq18CQ+EV7n9dUK11OPwlKCBUVaAe1s3x1bVV2kl39lA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzfmEUfbilxucW65vu05Z0jPVlSHntfGdsZhCuwLCX382YYbSJ9
	LRtiudJZsXlrrITWrQyS7Hm2gjAwlEbVK29agjSb4qQ0fDD2Zo5bsnKcJxBUrnyXmHfYI1Mj7Jj
	0We6zY1ebA76ClLUrAR0E2LLsLZ3ZfAz2esqurE44Jx7jAxHpzxlK/7CI0LbCzZoyxg==
X-Gm-Gg: AfdE7ckwT70TUCk54peP7+/C7I3LmwWJk5cZ6En+FZm4uKzYL3s9UXEL7irraO2qRk/
	Xm2NolTMYLi4EsfZJ46MuGMSYdxD+5GS0Bnub2uvHn5xcIa618m6S5WNUUucW4sIPPQ1AfuJBB4
	afdutxN+mJnPtBDmzu95uSXT4fyv4H7EYgVYa/R6EAmU7N4xmlMZKKDCkFIuRlbwaL2ehaHRznM
	LFMqe+zXJSTIH8oFlv/ko0Rt+V0hYUE4bVzt0RQtELAfRLmle+2MflcplyVPAzSM4Vi9m7qymgq
	JlxxbicLK58pdWReQmwGudZnfehhUULgti6rWpbgv3t0Zdno6V1tO1dehnc/wAJvCAE2BKBDani
	0/FS0EiSyyCvYbJNT5cq3yailTGLdOiGhVqN+yA==
X-Received: by 2002:a17:90b:4ccc:b0:380:f389:447b with SMTP id 98e67ed59e1d1-38755769514mr376382a91.11.1783343814424;
        Mon, 06 Jul 2026 06:16:54 -0700 (PDT)
X-Received: by 2002:a17:90b:4ccc:b0:380:f389:447b with SMTP id 98e67ed59e1d1-38755769514mr376272a91.11.1783343813871;
        Mon, 06 Jul 2026 06:16:53 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311561dd3a1sm16176449eec.22.2026.07.06.06.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 06:16:53 -0700 (PDT)
Date: Mon, 6 Jul 2026 18:46:25 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Paul Cercueil <paul@crapouillou.net>,
        Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
        Paul Kocialkowski <paulk@sys-base.io>,
        Linus Walleij <linusw@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Alexey Brodkin <abrodkin@synopsys.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Michal Simek <michal.simek@amd.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Eddie James <eajames@linux.ibm.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Joseph Liu <kwliu@nuvoton.com>, Marvin Lin <kflin@nuvoton.com>,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Srinivas Kandagatla <srini@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ge Gordon <gordon.ge@bst.ai>, Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Shengjiu Wang <shengjiu.wang@gmail.com>,
        Xiubo Li <Xiubo.Lee@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Peter Chen <peter.chen@cixtech.com>,
        Fugang Duan <fugang.duan@cixtech.com>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        BST Linux Kernel Upstream Group <bst-upstream@bstai.top>,
        Fabio Estevam <festevam@gmail.com>,
        Nicolin Chen <nicoleotsuka@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-aspeed@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-sunxi@lists.linux.dev, linux-media@vger.kernel.org,
        openbmc@lists.ozlabs.org, linux-mediatek@lists.infradead.org,
        kernel@collabora.com, linux-tegra@vger.kernel.org,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        imx@lists.linux.dev, sound-open-firmware@alsa-project.org
Subject: Re: [PATCH 00/42] of: reserved_mem: Introduce devres helpers and
 convert drivers
Message-ID: <20260706131625.nygqmu2usgifmias@hu-mojha-hyd.qualcomm.com>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
 <ceeca378-3c76-4b2c-81b4-0ff1bb1e99be@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ceeca378-3c76-4b2c-81b4-0ff1bb1e99be@sirena.org.uk>
X-Proofpoint-ORIG-GUID: dOWvmglZP6_xlIv9UVQiU5nIFGdLy1k0
X-Authority-Analysis: v=2.4 cv=Hv1G3UTS c=1 sm=1 tr=0 ts=6a4baac7 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=1XWaLZrsAAAA:8 a=sOACTKiIrrgCOb8DNPwA:9 a=CjuIK1q_8ugA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEzNSBTYWx0ZWRfX/nyGz0ujkkoX
 ET/Hv8WFRQLvI1BkhOL0aDTERJmqC6zciDppsgFmQa8IYADPVWvJTVJdk7HV/RSvxgaNIbbyCXU
 ECZMhTRBU36s25Z3ZWhp8DoMSDEb+F0=
X-Proofpoint-GUID: dOWvmglZP6_xlIv9UVQiU5nIFGdLy1k0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEzNSBTYWx0ZWRfXy8pdbF8Zeqf/
 sqw0b1MMN7+KyhBH5Zt0l85eLj6v3AEvunvMX6TjRzi+rC4kKk7rf0zsFNN1m0YjV9Vp9quKEN4
 6iL6M0XKqGibOpSaaav2MSF+jVlUU77KIEfJwSN69MlLHA+mTIR/ynByhJVSVTMkgY2svvtFN5K
 f7ytfBHyiqm8TpbXL6vl0sd//TkAuc3IRgYYprQsT6uDQCiUnCc1/l+J5+Uh9qOt7XXRL+aNzUy
 DzzXU+6ffgLXoJPyot952DTwakgN/gKOpLrs+nzn3BbJXjFfFSY8QGcbupAL07J4LAnIh9LiwMn
 DV9ksXg2ICGMBT2EabrkdryNPSBKnaTo7vReCjSFFwYdk0m3sA6aYfkyOd8sT57psEA04RfWjOS
 URvuaZXS9BG6I9ZdrPRBfkXYeHItb1lgHi39w7wfeVSCj3VVlaSklKQET+UbMxhzz4Eid5IlPRY
 s2rwj5SrhyGXALE6gQA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060135

On Mon, Jul 06, 2026 at 01:14:13PM +0100, Mark Brown wrote:
> On Sat, Jul 04, 2026 at 01:08:13AM +0530, Mukesh Ojha wrote:
> > Drivers using of_reserved_mem_device_init() and its variants must
> > manually call of_reserved_mem_device_release() in their remove and
> > error-unwind paths. This is repetitive boilerplate that is easy to
> > get wrong, and several drivers have open-coded the teardown
> > inconsistently or skipped it entirely, leading to dangling reserved
> > memory references.
> 
> Just as a general thing, rather than sending a huge cross subsystem
> series for something like this it's probably better to just send a
> couple of examples, then once the new API is introduced and either has a
> pullable tag or has made it to mainline go and do the conversion.  This
> avoids clogging everyone's inbox with very big serieses.

Apologies for this; this is my first series touching these many
subsystems, and I also learned the hard way when the entire
series was not sent in one shot due to the daily sending limit
via git send-email[1], and I had to cut many cc lists for patches
33/42 to 42/42.

[1]
4.5.3 Your message has too many recipients. For more information regarding
  4.5.3 Google's sending limits, go to
  4.5.3  https://support.google.com/mail/?p=TooManyRecipientsError 5a478bee46e88-30f0bbd2362sm49597158eec.20 - gsmtp


Thanks for the suggestion; point noted.

-- 
-Mukesh Ojha
