Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6087B3537FE;
	Wed, 22 Jul 2026 13:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784728510; cv=none; b=PtaUiVWxxDW4Fvqz3h9n0IIWdhsz1OHHtQzMdPU6KkujiijI8aZPI2qpW37Vc6Ng0nrQ91stKnvW9uEPuzeYH27u193poVJMivZOexi1mc17A4g1yhkyhfCVqnG43JOHr79KkDsYCbFpbY8UmTIM9pOtUrO3lPs9Q199wfoDzVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784728510; c=relaxed/simple;
	bh=XBCO//4bOUqgFpqE//vIjH+DujHRBBcSFqL2K6qxAPg=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=InYZqMhDlGsOQQ+625/LW/Hok6CaKIDu4VDjCuVtPJLZcza0TIHmzw+5fbR/i9VviziW8Oc+i0R5As0XChyJ12Aacr7+Xn52/O0dO0q1mMWvnsKAW1hR9S14d4uiwv71prkqe3VYFrqA9eGLJla5x8X1eHnr739EAsBhBR3vjO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=VxXSkUcI; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=TRgbYFzr; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="VxXSkUcI";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="TRgbYFzr"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 5323214000FB;
	Wed, 22 Jul 2026 09:55:07 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Wed, 22 Jul 2026 09:55:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1784728507;
	 x=1784814907; bh=i9XQ302+wMLYayJz2OXndovc8ZrOrsdUl9Md+CMCK/k=; b=
	VxXSkUcIT4hvugcxyzBUG0MosufyyYobGDwV4eQ6zjsUse2ywIkV5LZ/k6xlytTq
	CHwcAaxsSugEoJ7kLxbLQXhLmZUsInPdjeNmcbRGjW+E0RNwGU/yQzAqVTHXtYnn
	DUYWkns/E2EMpyjZUAi7QcI+/d5fj0803TZEPMgWriBsBmE6Bsv0lInBQ3nmBxp6
	Sk/v2khYxfPoLEVwGhRZ4fEK+nZAIWyPO5+SBcFyKlPEsljxIQP8/4R6S0jeLZte
	xHENpIVEvTACgSHySCsc01kGDmn2o7GAErLZ6blzNGgPPl268uKDTi7ZWZvhtG8i
	osEbADM4yJrD7g1dj3Wesg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1784728507; x=
	1784814907; bh=i9XQ302+wMLYayJz2OXndovc8ZrOrsdUl9Md+CMCK/k=; b=T
	RgbYFzrUnD9hLo2KqgtQUjvsMGqkDsSZ1m4NTd8IKFNzZuERzzA9mV/hwZzO/bnh
	A7Y1JSzGF/Cdr9BmsQMOKAusTXK1/SPq9GudOPoAndpXpu6lP4fMMPjVfwnWGboV
	ymr4lptacC5djLBThBaKMFZMv0Nj6Xq6Tbk0hsOfjzM636KssSUA2p9o2QMHcrgk
	E8qXLn11ju5q9EA6fH6o7+kJCeHbwTPsHAOr05um26Xwjn+oNs33mLk5zrVPMeEY
	OV+puvLqdkClPUPuo9FPj1xpa3pVgaEt2FI8hTKjgj9MLftTzqA98m0RvZTQfgcB
	GdDVbv5Mf9k67GaIo5LTw==
X-ME-Sender: <xms:u8tgams0iedW3eOKO3WzwUAsRvB9NBlXMphjY9GCtYPTa4aT8jzB7g>
    <xme:u8tgamRHttIlhijYEXbjFZLvbaMUZiyu08381mBWb1WR3OY4NV6Os9mrc9uuE-8Gq
    M2ZzQFC6dRPPsJv6trUYXuqu70EQxAA0GiVbEg4ijDmWQJ9HnxBOxw>
X-ME-Proxy-Cause: dmFkZTE40NkhG1SOB890bL2lS9G9xuucOgORKqdwfeK8xNraecin7w3CRgDs1MRMOm+Aa8
    gqlsiFUa2ppsT8tdBBUqDeLYH8gP0+O75wj7bw/8C9U2e2rt7s/0yaMplnjkbzog+hQhzg
    Uh5Q86b57aSxnQfzOaYnyUgtkVX0xQMrbZudJufhA1uENnnSc4TeuEi4LhlTHCfEN4mdH7
    eug8k68E+XrK2qpaHi/WaMJnRfVPIg/hwqG26wdlZ9GwVjtyhskt2WxhPi/wzng4Y3WxKA
    +72cnf709+pDDZmR5124c+mU8XXCdgbI/1SDqOoEt6vDDomo/NfTRwtcBtaaQqYO1oIiZH
    DG7Xk1Z6sDTUUo/zjwGsQXCuMxoR6p1vIKehMqAsaqVyoUYC1cRFz6z2zWaq3cvjwURE2o
    LkokTnn/ih7NFR4xLFeiFw9jec8wUDvNPfS8b0NgVvE/5k/N3LUKFoooIOWpZFJF84SOP7
    85kri0vTciWRWM5oorMPKFPZS0ysqh4bSW2FzXM2LrokHzXkA1b32BM2bD5Hv9kBfQ1B/w
    jaZSvEtimLHjVycPv3P6iPrl09fMViSFP/jf/nf2qCdiTYG2f8YgUWd5L1PudlR9UB3qfV
    lFClNw268nqZh5PwWUDWjO5WFbUkrAmio2xsurmluGDGS8XBEN6oXq6tDoMg
X-ME-Proxy: <xmx:u8tgaoLvP83ut5ZSEZJU1uNIxQStbOwDOAOFvWecPbp8EtoXgRG0pw>
    <xmx:u8tgatF7zGpimcCCBJ4CVZtzJQTSuNfqmaetcW33MYSGtV-Ij21feA>
    <xmx:u8tgas-tehRpUgW8IS7e1CEDOJQcZaDH0UyaIsRAvPD6KTq3aA8uXg>
    <xmx:u8tgalKx2b6CUKGj2aO4d-TLz2cHavN-bKO_a_EZO2i989bRhe6L0w>
    <xmx:u8tgatMF-yay10wYz45j0bdoOvVIIiyVbM_ej75wXBbwKZEDz6gpOPGc>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 1B435182007E; Wed, 22 Jul 2026 09:55:07 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AHTtZi6a84Qg
Date: Wed, 22 Jul 2026 15:54:46 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>,
 "Julian Braha" <julianbraha@gmail.com>
Cc: "Srinivas Kandagatla" <srini@kernel.org>,
 "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Message-Id: <de25fc15-f438-4f8c-8c34-67b10dddab12@app.fastmail.com>
In-Reply-To: 
 <qhrevlgsup5xtnxhhmon5cjic5utdhc2mdviczylqesw6yjjzv@s3kk2dr5vk7o>
References: <20260719022242.139472-1-julianbraha@gmail.com>
 <qhrevlgsup5xtnxhhmon5cjic5utdhc2mdviczylqesw6yjjzv@s3kk2dr5vk7o>
Subject: Re: [PATCH] soc: qcom: fix unmet dependency for QCOM_PDR_MSG
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Jul 22, 2026, at 15:47, Dmitry Baryshkov wrote:
>> diff --git a/drivers/slimbus/Kconfig b/drivers/slimbus/Kconfig
>> index 60b0dcbc0ebb..5dded61191e0 100644
>> --- a/drivers/slimbus/Kconfig
>> +++ b/drivers/slimbus/Kconfig
>> @@ -17,7 +17,7 @@ config SLIM_QCOM_NGD_CTRL
>>  	tristate "Qualcomm SLIMbus Satellite Non-Generic Device Component"
>>  	depends on HAS_IOMEM && DMA_ENGINE && NET
>>  	depends on QCOM_RPROC_COMMON || (COMPILE_TEST && !QCOM_RPROC_COMMON)
>> -	depends on ARCH_QCOM || COMPILE_TEST
>> +	depends on QCOM_SOC && (ARCH_QCOM || COMPILE_TEST)
>
> This defeats the purpose of COMPILE_TEST.

The '(ARCH_QCOM || COMPILE_TEST)' is probably not even helpful
here because QCOM_SOC also depends on that.

     Arnd
