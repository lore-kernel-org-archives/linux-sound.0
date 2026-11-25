Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795640037;
	b=NG6svU2S/rrmVrRshc1jJf5CwRbPFB7MAPu9YzTN/oj7WWBQGJkaZ/AbTX+hQBLaZQkP
	 AsWe/lklOliXLfY7hWPSDdekeJ7FOoUf4fVp/xEs+Ndl8/nAzfiZdGjQDS/SFh/eAy+ZJ
	 Ohmn6PZpeE7UsgA0czucGwXJDB73LtVTENuI/DJOQdiH451UDJoJEGHx/Ex9BBNLsOa/l
	 kR4mKB5lSntplGtgoER4X1ZmvLSO+OuceEWHFE4hulWkh05ins6ExiFoK0/juiDY+ZarB
	 LRe1GsQvZ4RKL8wmJQvgV8q9WNcPsReYNMdTihvbtf9CQIr1Elx130AKPEm25ea08Mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795640037;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/0kOuvaODKSr9qNRTrJCahBXkTW1GM+EZkzdPOkJXoU=;
	b=Lkbe6slAa2Y8C9D8oQO9kIMpruNvihr3Gey7tohl491V5Fiq8zMI7d82eK5ke+e5mQBD
	 mQITty0VLyeo7zpT0BAK2ueVFpu0B1HfHCfJQ4zwhiY5MuD9u+mj6fNu3J7ZcwFRD7XAV
	 WGlBbZ0ZJo7R+0bwzAqpduYf8p7wKBHLwQIVbDWiO2VZKz7CWm680ytLeLjtFhtmvSKlX
	 j6cG8Pz/h74mRd10jq79zfMMaUYkgPg0BFA0SZaR2j2iF8a/4D0MYL2C7CKcHQRKI7gae
	 kIzLYngBgOW41BkvjsdLINM88ADPTFjtygs6DoH4p3BJIBxos5quZ0kae+AYLyC+E3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kHSUR64r;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099DD606A323
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 20:53:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 099DD606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kHSUR64r
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48e47347279so3797788f8f.1
        for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 12:53:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795640035; x=1796244835; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/0kOuvaODKSr9qNRTrJCahBXkTW1GM+EZkzdPOkJXoU=;
        b=kHSUR64rxOaYJSvlMKGWvp4XkDYf+YqtOkLXLJoxtfrDuaapAEwMYZnSpWmS9V0hCd
         c7p4hvibiXhupX+1AaK8yvQ4SkfjVFUsqLg846rFJ3rbRWn9r84/+s274bNcebOpku6+
         rvCXEeOVxcVXxRJ0E9cRH45KTy/uGIrn8tNjDzsRpAqimd3y7dOEtl8TgJdbsZvErAMt
         rzxUYQOdRW0ghLWGyI6aJlg2hw36Ypldvpy8KdfSNv6P4JHed5oWvHkKr81+kvUqK+/X
         5LzQpCYPsYo4tYeQvdrvffjTF67HH3rWZdVMhc/cekCQ2QGK6T9a92ibEYjD5zJjwbQz
         mlmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795640035; x=1796244835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/0kOuvaODKSr9qNRTrJCahBXkTW1GM+EZkzdPOkJXoU=;
        b=w2GyNBobymbvDnru44Xer4mkVbyYCrNT/kAfxrqCxJ/aAcqTAEg50++rNp9Ib3YYxQ
         TNvGYiGur/0Dt3pVu/UdkWNFpArpcNjTcwdPT0hHMeZ2oPcuwq7S5FqvKFXfg85VCTTL
         gfgJ/+wRthGl5ZABNYe5Vri2RYDXAc38tGAndNZkVmMliiOwVZZWX6x/Iz3NC3w0b/f/
         jsnUL6uyJB50Ep1LBNu3/O1o3WseM2mQ5f+ykQf2/QsN982aUTMxLMiLc0lHg/6SaBsa
         oX6EQRPvmp/vZtyV4SSrGnvIWTKmsn/wfoMmRHlYh8D9x66Pe4Q+HTwWOBY/CtKLO9EF
         nZtA==
X-Forwarded-Encrypted: i=1; AL+hErE9J3HkROyrQBiABwpLqLLEUR3v7zvSp8Lj4EInEn5nm1BCCfo8ma0rzFLKVg7caSQY57NaGT7Yzg+XxA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9auwJo8gBVfn+sWb2sYL+oIjiTLrx985CH5P7tgFN0qZ+pN+dj
	PTxoj4xIvtbRdicLOC+OJbWsTfgXNbWRlXfM3Ro9ILDt5xs3Ozd10rWQ
X-Gm-Gg: AZFdTZdimLufUeUKhAY5+MfmQZ657ySycmE4EQxJ5MKLdE9JPgeqR1cDU+88MUworF2
	EVIQBCxX4Xfr0pMWc5d6Mx2SSTjYgw+qJ3keCxWBIagNjGDfcr52No1ahEeKkstBkpo99r3nb+H
	ZhRS6qznq63pTsSb3+Imu0YELnxQqa7mI7W/rzWvK1gdX0yvRi4J3M0q79BUEQQd2rL4h+wqxsH
	EpjqMioLMmArVYMa1bpJVmkK0l1tr0dZ4HP5ODNv12aKcVlAR00bBfXtSSKZb8F1kq8avA7Kxp+
	7Lk40lljcOiw6adCp1RPK0E+Hwh//AKPoG11pcQubOH9V81XcajPR1z59k/ywlm+mTLkhM2UDGa
	k29cYdlFWG6SW0d96PZTN//4hJUffeOPAzDDDO8m+SF0E7BgqmAowclhxceSdcaatx+EFykHipC
	i9prkZsIYwBc3HNXDpNRgF/z8WPLeQLACY/GVUA6kt6N8gE7NC7cj9EeejleojGdhHtyX9mOB8G
	Z/eK+Kw9xOneoOuHfo7u8NDKtbmY6jFV3POdNKCg8uHLj/HaDJ6WRTHkULKdlZTErlSk1/WtqJo
	kGWycrLN4PEoKz9pFzFEU65JaMSIlmNFJQ==
X-Received: by 2002:a5d:64c5:0:b0:4ab:c3f8:9f65 with SMTP id ffacd0b85a97d-4abc3f8a051mr35044102f8f.26.1795640035169;
        Wed, 25 Nov 2026 12:53:55 -0800 (PST)
Received: from kreach.multipass ([77.37.5.67])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb42absm37752535f8f.1.2026.11.25.12.53.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 12:53:54 -0800 (PST)
From: Jude Gyimah <jude.gyimah87@gmail.com>
To: arnd@arndb.de,
	lgirdwood@gmail.com,
	peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	daniel.baluta@nxp.com,
	kai.vehmanen@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	Vijendar.Mukunda@amd.com
Cc: broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	sound-open-firmware@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: SOF: ipc4-topology: fix link failure with SND_INTEL_DSP_CONFIG=m
Date: Wed, 25 Nov 2026 21:53:43 +0100
Message-ID: <20261125205343.56030-1-jude.gyimah87@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <c8c7c888-4b9c-490d-afd5-0b49ae98b5cf@app.fastmail.com>
References: <c8c7c888-4b9c-490d-afd5-0b49ae98b5cf@app.fastmail.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> IS_REACHABLE() is practically always a mistake, don't do that.
>
> There is surely a way to correctly express the dependencies and avoid
> the configuration that leads to this.

Fair enough, I'll drop that patch.

I did try to express this in Kconfig and couldn't get it to work. Here's what 
I saw, in case it saves someone else the effort.

Adding this to SND_SOC_SOF:

depends on SND_INTEL_DSP_CONFIG || !SND_INTEL_DSP_CONFIG

doesn't avoid the bad configuration. SND_SOC_SOF has no prompt and is only 
reached via select, and select ignores depends on. So olddefconfig keeps 
SND_SOC_SOF=y with SND_INTEL_DSP_CONFIG=m and just prints:

    WARNING: unmet direct dependencies detected for SND_SOC_SOF

Putting the same dependency on the selector, SND_SOC_SOF_IMX_COMMON, moves 
the warning to that symbol and quietly demotes SND_SOC_SOF to m. That fixes 
the link failure, but only through an unmet-dependency warning, which isn't 
really expressing anything.

I think the underlying problem is that the provider can't be selected. The NHLT parser 
isn't a module of its own. intel-nhlt.o is built into snd-intel-dspcfg:

    sound/hda/core/Makefile:18: snd-intel-dspcfg-$(CONFIG_SND_INTEL_NHLT) += intel-nhlt.o
    sound/hda/core/Makefile:19: obj-$(CONFIG_SND_INTEL_DSP_CONFIG) += snd-intel-dspcfg.o

SND_INTEL_NHLT is a bool that only decides whether that object joins the module. 
A consumer therefore can't say "I need the NHLT parser". What it gets is decided by 
SND_INTEL_DSP_CONFIG, which is about Intel DSP driver detection and gets selected by 
SND_HDA_INTEL and others for unrelated reasons. No symbol means what the caller needs.

Moving the calls into Intel-specific code, as 194fe0fc3422 did for snd_intel_dsp_driver_probe, 
doesn't look sufficient either. ipc4-topology.c fills ipc4_data->nhlt from the topology manifest 
when the BIOS has none:

    /* no NHLT in BIOS, so use the one from topology manifest */

So generic SOF can end up holding an NHLT table without any Intel platform code involved, and 
it needs the parser itself. The field is even declared void * in ipc4-priv.h, which suggests the 
layering was already felt to be wrong.

If that's right, the fix is to make the parser selectable. SND_INTEL_NHLT would get its own 
tristate and module:

    obj-$(CONFIG_SND_INTEL_NHLT) += snd-intel-nhlt.o

and its users, SND_SOC_SOF included, would select it. A select from a y symbol forces y, so the 
y/m mismatch can't happen, with no IS_REACHABLE and no depends on.

I'm happy to write that if you think it's the right shape. I'd like to check first, since it moves 
an object between modules and touches the Intel callers as well as this one.

The config and the failing link are here:
https://lore.kernel.org/r/20261107114944.561731-1-jude.gyimah87@gmail.com

Thanks,
Jude
