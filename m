Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B4A2BDC05
	for <linux-sound@vger.kernel.org>; Fri,  3 Jul 2026 17:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783099399; cv=none; b=Pv0q8kKiE84k/0WjWyoOdLYS98GWwqHtskIQ8hTpThlB1qnRbBtXb3bN9NFgmdff9AnD8dfTrLwCXomfDKRLQEKI4J4+/+afSCUVHcvgQHEUyi/Mxor9GWAlPfQ2HMenaKZ9KxDQvW2pICdkqyolJp9GydOVfhQjks2auRD53hU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783099399; c=relaxed/simple;
	bh=0up3X3VC2fr+gRB8uZHELvWzcZQGMYSNttjEbLvtUGc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TMunUbZZrOQmHS4/afZeAhFo1EA+SMOkiXqcx1KNpMoVSbth5RFQXzptjKS+Z756DMs02H+QpJkpjIEspHaIoDIQ7JnvCxvmtLySzLycsKJm294NeVCzqAb8uh4VHBeSGj3TPYahHeHsXs/RoRl1BnJ59TZtkdRf+3cU92VZdAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JArJfehG; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JArJfehG"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c127ec4447cso111526066b.2
        for <linux-sound@vger.kernel.org>; Fri, 03 Jul 2026 10:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783099397; x=1783704197; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=mBESswN6Y8XsXKSuHEiEMpM0MOv1RPEae5qTrECTOF8=;
        b=JArJfehGwHQFoTCaWBWDxDaWi2zA0bzRqkGqk7Y5kXwGPa1hb9Aj2PHjoxAzRTva6Z
         TXpNi43H7pPW3CMxnnxSkFYaj8F9Gl4GKJK2bZWrqyWg728tgCfjCErb10mmjmwSolEh
         5AyuegqagzhWP5FWjeMbao1x0G+8+OZen8GXLxsbEwwZ/UDVVECxOQ9lOZhceS01palf
         LfNG9BPFr5wxslCqpCsFkEl2WTAT/Q6RVgBkp6P3hj0EVzPf07NyNWmdZLoRCpnkq5Sj
         xQieKL7trKWVD+An4XwdoRKKV+GlUTaqShNlighdmYO74VpjSkwKOMfNlG3tWPwpDlOR
         cq0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783099397; x=1783704197;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mBESswN6Y8XsXKSuHEiEMpM0MOv1RPEae5qTrECTOF8=;
        b=BzDbNjO6vGpv5sFXzY/+XTrPfgAanBQNVquDe/jwunNHZreuuLCBRUDBX9LqeUW5Bu
         aogPg5DWdP3Fne2Wsdk4it3BRWljbWdlUF1zhz5dUa4dedTlJpXhv5Qrjbu1/oAEHauf
         mIkYwaWI35qtZW7h5rtTUH6EUKYgfumU61+HYYNN1PLm6lEdI4HEXPp3JQRRf5jcRtwC
         5UN5YjGnsAht9aOir67e+ilhUlnwaGnSY8cWLdfrnYJig+tGyJCNL0TrgmwnrzJsk4pm
         31kR8NZweXk/4N1tv2NISUzpdkvGh4P776eYPtMLBwaxJE12N+QIw8N4oFFD0xz2ONp8
         dXIA==
X-Forwarded-Encrypted: i=1; AHgh+Rrc86Gxi2QryJIqrePl124Gu5GCG1LTEd186IxnJPQofOeUUBk1uB8SFNI9uiWY6VLYGTzMMV6eYIGzPA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxNBj/QSL/WKMYrYadnoa06DgQXXahz0yvvPOheghz57qVyL7BD
	6ogFIeqMnSxnHv7h44UhdjhAHNwnqCRJzS3sPEkre83R050I0JKejlP7
X-Gm-Gg: AfdE7cnEi1V6vbsdYDpN1XLL8T1LWr6vz5b2xbVrdT3TBP/V056Orwh7qUFDMVlxDTL
	NtfJA1dGknmuUxLIITdeDEIHBqfByhe3JdzGtPC/st5ufElddWlghGJ9tui4XmpCdvvyVup7XB2
	DMLHRb2sF2SigXSHvnzksI4egipNIvVMrBCHoggSoW9k4eLUSW67LwUHvYoY85nk3Hz0HfK1WKE
	eipnxgVpDG84gYeCH6bYdn07/n/HDPTYO6bD0zLI1LlGsOKka25cuvJ7BK3thV+i8D6wf9dlatD
	Vwo7Dwq4sVeCC9TFNKEUdTCmzyXm7SpdKoMgZsTZY2mDeA8qB9IG+JMPj/TNm1iodGr6GuiAjtO
	yz3tZSsVUnF/XtK70EZogrb2OC5LGb9MiRtWYkxByip3IlIoyxjD/OMVWr3dZhmyXLsdRzl7zzb
	4xKF/cZ1MA0bgiYmVTLeQiW1/DKcG8zxnB3C3PMUvCD4zdjU+ry9KC8oUhu3uH1ZiWJL/kxH9gl
	wKzGOfof/zpGcfHL3Q=
X-Received: by 2002:a17:906:c8d6:b0:c12:78fd:250 with SMTP id a640c23a62f3a-c12e43e1ed5mr18000066b.59.1783099396668;
        Fri, 03 Jul 2026 10:23:16 -0700 (PDT)
Received: from [10.128.11.240] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b628d632sm308123766b.31.2026.07.03.10.23.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 10:23:15 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <cb450caa-58d6-465b-a694-bbca3949e3be@gmail.com>
Date: Fri, 3 Jul 2026 18:23:14 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/16] ASoC: SOF: amd: add base platform support for
 ACP7.B/7.F
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, broonie@kernel.org
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
 perex@perex.cz, tiwai@suse.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, venkataprasad.potturu@amd.com,
 mario.limonciello@amd.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, sound-open-firmware@alsa-project.org
References: <20260701095759.1012929-1-Vijendar.Mukunda@amd.com>
 <20260701095759.1012929-3-Vijendar.Mukunda@amd.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260701095759.1012929-3-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Vijendar,

On 7/1/26 10:55, Vijendar Mukunda wrote:
> +++ b/sound/soc/sof/amd/Kconfig
> @@ -103,5 +103,15 @@ config SND_SOC_SOF_AMD_ACP70
>  	  Select this option for SOF support on
>  	  AMD ACP7.0/ACP7.1 version based platforms.
>  	  Say Y if you want to enable SOF on ACP7.0/ACP7.1 based platforms.
> +config SND_SOC_SOF_AMD_ACP7X
> +	tristate "SOF support for ACP7.B/7.F platforms"

All of the other config options in this kconfig have a line of
whitespace between them, could you modify SND_SOC_SOF_AMD_ACP7X to
match this style?

- Julian Braha
