Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795099875;
	b=0ZOeZH94boFDgN7AD/EyLvYWSPT6l4/svjGS6UfDayrxiC87NtmLTNOvxUP3H3TSvmps
	 6hY9imTt55+HJH8tJiudTfGH0Sj7x+JGsTErSTDfUFOMT940xRR9wgM1lNCfTBemw8HeO
	 Cf0HgEywg4u1gVz9QMn3GlhF9Slvb71CERoE+F3QhQk7W1liZs5iuhi+vtzOZtFHnttSD
	 dQvbvL89Lv0PHu4dCPsPeRFPPDq3MCocGE/QQjMwhrdBD1MTS9IvEnLF0sU6dtW9NGGEP
	 x8ZRMjen39GBbfFlnE5D3Qs/GuWoALB4aEji5xKWWdz7h/+59JNAtaxp3NpZ6kIisCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795099875;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=VI1AZtVr0OJhV8gaZPX5TclahNu0z1FGdCiJCKtdVDU=;
	b=Eob/cIg+KCyl0v/yp7rcesce+JwfTSj7Tb/aqeZyOe43UDcqMIG/OeSQSSmtWktzdPtx
	 1eBtG2V7sB9vNpV/9huafpCDKAwBuqsNFQ4vKCm2EQG3Dk4hu6VSKMRES44MUOtythulq
	 1Ml69fpWM2ov5Xn9dMdfke9jTK2/tf5u2pZkOKoZJ5YwwNZbK0pE7xBV7dVPhG13LCl0+
	 Cj5Vpg9KvS3C3JZjdKlc9qhQanJHUIY9ZobJa/2xrbsx0ZnrpKGI5EmHrsQTqiHBRO/yp
	 RDr2+kcVduli83sDMIkjQH9nboLI94OSwJYewwWTJ3DCSxMskto2nxRf1Kqj1gcR2yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VL7MC+zF;
	arc=none smtp.remote-ip=209.85.208.178
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E72606B062
	for <linux-sound@vger.kernel.org>; Thu, 19 Nov 2026 14:51:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7E72606B062
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VL7MC+zF
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3adfe7a31dfso2353391fa.3
        for <linux-sound@vger.kernel.org>; Thu, 19 Nov 2026 06:51:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795099873; x=1795704673; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VI1AZtVr0OJhV8gaZPX5TclahNu0z1FGdCiJCKtdVDU=;
        b=VL7MC+zFVy9dh95bxdI0i4adxbHSpzTznJz8NOe8ktBQfQdW132dePH/Zt5Grc5VYp
         tJUXKNhVIaRN1C5TmaeHf4EAy+7JVM8UnyWYN6PB0ahMjyIJ+nRjdIR52n+C4eGQkSqM
         QdiQ8oRu+d2g+jFUbUQL4wz7w6eWQ5sNGs312ts8oxAf/ravDm1bah7sz/7vIyfX1gU2
         p6cYrHvPBl9OsmoGWFuyIz2wKAujNHTDxzg0fvuC1JZ4JNGYSjz9O4b2H/w39HdHSI6O
         E8LuXuunIpl/zXVj1XzTaSKBcxAMgmDcXGmFAku/kysC0Bnq/132nw0A6n/CtzaXAN7n
         K7MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795099873; x=1795704673;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VI1AZtVr0OJhV8gaZPX5TclahNu0z1FGdCiJCKtdVDU=;
        b=Z+uGOjIzt933eRA3s/AnSleUocpcJUyc1XIF8xeqXiWds8pgtzkSxIdk1j+Zgo06W6
         8tK1TQG3CAzyQVRG8ikj6V4vTDkQ5NI8pgdj9dO6IgcSpOq3PIQifn79KtZllH2P4YMb
         5mdMdGJUmSU3fnWZg1ZCLpICQz2bIod0J9B3/AFKYMk6RYsr3vyoeeTR4rPYPizWvNOn
         899cUiENHaykuOTYxtAD/J59aRYOZHCPDgS72GYokqXnspxhR/C5GogWndo318VGKYgK
         KZBESeBISlLt5oHcTt9gvXCsRyoX9NUvGVg6y+rRrMeUmiUQOIa7v4XtaKH996RIBWAG
         QK4Q==
X-Forwarded-Encrypted: i=1; AL+hErHaQsEhEv4j6WdUoggZR34harJqo9SY86n3pf1+MwPCyocv4sCl5UP9T6cm9GSrJ1cdUTu5jemHnOzyZA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/f79h5U/TRZgaHbSfl0ir4n2bJl1/VMqWp9tUqdKM6WGZHfRsC
	UEbIf6q47fvJ/B/4ZsFXcqZDuCu9s0opqlDLUhsvCgFflRJkxYg99UJJ
X-Gm-Gg: AYBFou34oLJRzbh2NMEgKbn/sHHUVdrBaDwEIZZsguSBzDFhQYSYeCP23XUNH5TfMtu
	GMvk2LptFvY17t1kvGmlYTg0Jw7pzHZMfutAB08dHfiUcndfJD2eEPkEyCzn4QdGGZneLe7NKX0
	juMkankeftHdzb7c0SpzjX1TMIpiF3CnnYs0Sd6C+7i3dERzvwRxE+WuXDWuQgqPqh0TYbVD18T
	6dc3Sbkpt2oSIrdyasKp0ZVCwhhS5Hs73QJ+NXj9iSGJ2+a4fmWbNstTQlgzWCQ19YOMkKAG6RK
	/2/S0iLPjMoE44jPMGfSQVF+AIovtE/wVSviiu3Kn/lIyNZ3ECO87DV/6tFFZMt/t+qPojbZNzX
	KwZnx5Zwsq7WHSLXw0lTp4kwOH+xRNzjc+bfz+JhKcK8KPwMjCstpbHmGP42etJjh1LKqvzbHWU
	+Rbuh9mabE9DXWX61d+X6DZuwRFvlu3603t5N2Z7o/Ziw5iIIcKh5mb5tZNC21NwXe3H0+5W0js
	3+8S854/5eKOx4UERg7o6xZB4BBoVhyFlahrbHghVmhTurS8pUQNpykYBmVgPMHVsxF3xABV4+q
	WFhcZUIGBWiO9+LP2EOQzjPiMsXyeU7dbExzM3U6MFntSLLBgaLv3Ckw3axUsOeirM150CSjiuu
	KbdEdx7hV8Gy58BLS93byssR3YcEuS91jadJKO/15EkTpQW5gocgJ34rV0pQGMw==
X-Received: by 2002:a05:651c:c011:10b0:3ac:dfad:319d with SMTP id 38308e7fff4ca-3ae7f9d6f4bmr334811fa.1.1795099872835;
        Thu, 19 Nov 2026 06:51:12 -0800 (PST)
Received: from localhost ([178.150.68.2])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae6ea7c659sm11264611fa.12.2026.11.19.06.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 06:51:12 -0800 (PST)
Date: Thu, 19 Nov 2026 16:51:11 +0200
From: Ivan Verbovoy <ivanverbovoy@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 linux-sound@vger.kernel.org,
 linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: codecs: wcd934x: drop the MCLK on every disable
In-Reply-To: <179509724666.116416.15851195764740977182.b4-review@b4>
References: <20261110-wcd934x-mclk-v1-1-c62956792a3f@gmail.com>
 <179509724666.116416.15851195764740977182.b4-review@b4>
Message-ID: <20261119-wcd934x-mclk-re-ba7379da5f2f@gmail.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Nov 19, 2026 at 02:07:26PM +0000, Mark Brown wrote:
> Are you absolutely sure there are no other paths that could do this, for
> example take a look at wcd_mbhc_adc_detect_plug_type() and the rest of
> the jack detection code?

No, and you are right to point there: the jack detection does not
balance its calls.

wcd_mbhc_adc_detect_plug_type() requests the micbias once per insertion,
and wcd934x_mbhc_request_micbias() takes an MCLK reference with it. The
releases are more: wcd_correct_swch_plug() releases at its exit, once
more for a headphone or when the work is stopped, and
wcd_mbhc_report_plug_removal() releases again on every removal. micb_ref
is clamped at zero, but the MCLK reference next to it is dropped every
time.

So with this patch alone, a removal while SoundWire is running would
drop a reference the jack detection does not hold. The early return is
what hides that today.

I will send a v2 that first makes the jack detection drop only the
references it took, and then removes the check. The board I test on has
no jack, so that part will be build-tested only; I will say so there.
