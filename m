Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 551E73F0A8C
	for <linux-sound@vger.kernel.org>; Mon,  7 Sep 2026 03:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788752846; cv=none; b=rTuYYEvOV4x0d9QPW1IX7opPdcVRydcouZnRImswjwRG4AYsyrLaiREyBVHIU/2Yt//ujcNyak3tuWyBwXvnfZ5f9SpBJkZL/zHvRqWr5QQFrEG2EjMvuKFkqLRoOre6UGHDXc0Iv87QYy9TqAHxK4APScb0u8zXKNTLWQoIthQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788752846; c=relaxed/simple;
	bh=6jmWJK61/SjCyFrb3g0NExISI2RjY7LO/yDYliJAQ/U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zl1QbVSweTFUo/tgVx5Y9+D229Tb3pfV/h15YI5BtsddiccGtJg8cq+uhUKbhzWRGtjwilLdNgwDRjZ63LdAfctLvh4YCnDjRJivdGOXG5scEzlBSD1UyJo4OVeR2DEkrBziXSDc/+9K8OGiweWe5Rh1Sn/XkOPQrI3f9b5Nltg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CiPYKts5; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CiPYKts5"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-853f8c34ba4so3809492b3a.0
        for <linux-sound@vger.kernel.org>; Sun, 06 Sep 2026 20:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788752844; x=1789357644; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vljcaDx2KvDeXjmIWLAHTkvLtKLMiyvxJX3Uoaq3r8g=;
        b=CiPYKts5sIwcOvA1sXwYuITRHwEY/9tkjxmgcjhEe+QCf+DbbVTuEqt40NlgYq7EOX
         7Iu0wNGzWjJiK1K20QqeMr5Yq9ND9xY5HUTKCixQ7iWVP0VsHpUjhJwtLDHCJ6Yz8pJu
         In4y84MNgaEDCSBjNa4vmv7DhTUAVNfsZgZm93m6t8a+DuW+aidqEJYMXSFgTvLxv4wu
         GfS79BnklAzVllHGrUs47bs6xzkokydxJxkqRjLD718lheWxy6Kt2ryVn8685TWkrmWl
         ZE0jq3y6fHx3DxVCRwSCI1mo35xAlune0fK2ylTwxrsBhJq2H5kJqoyjb8J+eiHVT4NP
         0KGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788752844; x=1789357644;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vljcaDx2KvDeXjmIWLAHTkvLtKLMiyvxJX3Uoaq3r8g=;
        b=BxDW1C175mu0XgsTADkyY/PVc9tUqTgse0mqT7tPfg2daInemMzVT6XD/wCufyPyad
         5bzxHxo90kOIRB4302ZCbH5aWGFTOW2jOv0WGzCQ5+jhwGGMXUGQqaEJnc2FYt02BHa3
         dxPzOkMxqp5+RBeVUlSABRBUhXnPA4jugIw8la9PNV15hVm+80WRAkug2eSIxbUR3hPL
         I+c1u+gPhlszIMl2lRP9TgjNEjxdCstM4QNjnoGjrWpJs5v35JDMh36AS+0IJbaa7gsL
         FWzW1rO0VByb+RJRiyjaKS2ON/P/6e3+snrtOq9eXMYGx/CTAkR4BQLDP5YmxysXgvt5
         xOXQ==
X-Forwarded-Encrypted: i=1; AKwUvBxU+KsIGYoG+ww/Xbf1/hVD3HQuB2iCE3YTDwowxdCUs0kjJlfXINATbhIHO1XJygu1oZcinWhiCmxqnQ==@vger.kernel.org
X-Gm-Message-State: AFuF++n46qM0hNcuYPxHFgbF1on+T+beao07AtucEY0igv4Q6tO6/qLA
	DtzzxFDUuXQLm5xG5mm69LXGPM0WDFbF1cuIr71HjZa8W9NP0qFzouC2
X-Gm-Gg: AYBFou0QTRVDflDjo1bxOJ69/8iE7fFrVV88ac1Ua/ENV65FMzKYm/ex1wlhYiow9AL
	HTucVBZHOs1s6A4MWgT8r/3KvymQ59uVxgAuFt/95tSBS6Bwlm3qXJKOKvYYP1glvB34QhaHJn9
	IEhJP9LJtU5lMRqTUuigVs0gNkbXLRuImgB5OTKKIzuiBNyKJeT77bBccP30EeDMqwsEyiDhkSI
	KWug5CZCWvhqHdvKcxP19osItu+m9E2vbMKMxZ7yYIGsxOlD36ohrZejQKwt0Rdrm5BMDldjzpm
	YSoFFvFmtEjjpoC4erqzOGI144eS0S4fM0SIUtWVVL3MQ9vHjJ13T7N4q+r1QL0UZSgd5AbitHu
	8R9IRT7quZQsJ7t36tKQtSoMuYV1DCPQP25F3b/NvlAC/Nk2q/DbLF8/8F2dDL0cHlnPWnbSMJP
	UxB27U9DaQNxhYXkgCCFObE67sgoO4iB622d+id32rAGhgWtjN9fCiZ9xM32O4HWutUY/snd6Rz
	dEzAp5UO8agz9S3TK0Q+SjJeYw=
X-Received: by 2002:aa7:888b:0:b0:84f:dfce:966b with SMTP id d2e1a72fcca58-8616a06b9eamr25052174b3a.8.1788752844486;
        Sun, 06 Sep 2026 20:47:24 -0700 (PDT)
Received: from [172.20.10.2] (114-137-107-99.emome-ip.hinet.net. [114.137.107.99])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86152a358a2sm3690281b3a.29.2026.09.06.20.47.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Sep 2026 20:47:23 -0700 (PDT)
Message-ID: <a5a983de-44f2-45ed-9a71-0839f5349d46@gmail.com>
Date: Mon, 7 Sep 2026 11:45:10 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] ASoC: codecs: nau8360: Set DAC path to bypass mode
 when DSP firmware load fails
To: Mark Brown <broonie@kernel.org>, Neo Chang <YLCHANG2@nuvoton.com>
Cc: lgirdwood@gmail.com, perex@perex.cz, robh@kernel.org, krzk+dt@kernel.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, kchsu0@nuvoton.com, sjlin0@nuvoton.com
References: <20260904060035.196399-1-YLCHANG2@nuvoton.com>
 <20260904060035.196399-2-YLCHANG2@nuvoton.com>
 <apsEO6K6Qo1ADH-y@sirena.co.uk>
Content-Language: en-US
From: YLCHANG2 <neo.chang70@gmail.com>
In-Reply-To: <apsEO6K6Qo1ADH-y@sirena.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 9/5/26 01:47, Mark Brown wrote:
> On Fri, Sep 04, 2026 at 02:00:34PM +0800, Neo Chang wrote:
>> Automatically route the DAC path to bypass mode if DSP firmware fails
>> to load, ensuring basic audio playback remains functional.
>> @@ -1702,6 +1702,8 @@ static void nau8360_load_fw_work(struct work_struct *work)
>>   	if (ret) {
>>   		dev_err(nau8360->dev, "Failed to initialize DSP: %d\n", ret);
>>   		nau8360_dsp_enable(nau8360->regmap, false);
>> +		snd_soc_component_update_bits(cp, NAU8360_R12_PATH_CTRL,
>> +			NAU8360_DAC_SEL_MASK, NAU8360_DAC_SEL_BYP);
>>   		return;
> We don't generally do things like this, we rely on the user to fix up
> their configuration, but equally we don't have a good mechanism to flag
> problems with firmware download to the user.  It's not something we
> really expect to go wrong.
>
> Since the register being updated here is a user visible control if this
> does kick in we should also generate an event on the DAC Source control
> so userspace knows something happened.
Hi Mark,
Thank you for your review and suggestion.
I will remove the register update (NAU8360_DAC_SEL_BYP) during firmware 
loading.
Instead, I will add the following check in nau8360_dac_mux_put_enum() to 
warn the user and block the path switch
if the DSP firmware is not ready:

int ret = 0;
//....
mutex_lock(&nau8360->lock);

if (item[0] == NAU8360_DAC_SRC_DSP && !nau8360->load_fw_done) {
     dev_warn(nau8360->dev, "Cannot enable DSP: Firmware not ready or 
disabled\n");
     mutex_unlock(&nau8360->lock);
     return ret;
}
