Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378BE29B8D9
	for <linux-sound@vger.kernel.org>; Wed,  4 Mar 2026 06:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772607432; cv=pass; b=LixZb+4zehvJ+L8uc9LJU9M9rdizn5BJtRJaFsPvq9b5cZiTXfjhF3VkaE7E4cPpzIm3Ah/D9lGOBho2ZR9DMAsOEJ7k4ejxzsl2YK2Vn8rolgZZLGcb6ivfSKDSaRST4nLAWlpBEwA09iRRUHwPwuK/PQ3ocj48S5/IlRflYJs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772607432; c=relaxed/simple;
	bh=+8kjk3BKh4pDWT2shDCWyUn8SBarnPJVpjf9CvZtbok=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hk2enU6K81Hc+/dCDsBxFXFjw1egmDyamgEm18TwBqcz15rA6HHHLsmUx5ytBK+vHbGNVzt/bkaLBlx9ghK0cbgJgelMXgbifD8Tq5SWSqT4R63RgNoDQHn+N3tDz1VsZDuywIBti+bNY8lTZ18h1cHnjctmDucwv0gexMBi7Hs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iW91YSGp; arc=pass smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iW91YSGp"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-356337f058aso3251100a91.2
        for <linux-sound@vger.kernel.org>; Tue, 03 Mar 2026 22:57:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772607430; cv=none;
        d=google.com; s=arc-20240605;
        b=JvimqcAN020dvCuMqNZp6pw4HTws3mFn0UVqKHcYGNzT9HY7YerVtgiG/dcfkLO0Y2
         YKdm9yJvXp6UtPP8FM/VU/Piu1TvCUEwZsdBN+xQWYpAsDm+I9nMoGRbF7Z4JdppCDNA
         382tZCQIExYnLomGDdPUr+KYZbxmiXq3YahwXTj5nuhxja92kWTBgqwHIgMk93HaZREJ
         dD71mLIQyn7MBwLYjiz8h+qkSjBMcDfenUoIOuVfFHig21czzGEvtDRhBSMn8inrqO+z
         GKtDyZZQumbCAwEbVj9p2u80FTYJ7Q9V9s0L3d5O7n+aAqiXTzDyHY32zEJX93AiMamK
         NOlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zyusLvJCkkWzcJR88zYJ+rt6lxear+OrQKoL1DsRYO4=;
        fh=VYuepgDz3TX+MptAbCF91+8kD9i+L/8z98srLNBIpjg=;
        b=Xu4BbCu4m01BcB3FfIK/zVLuyYHM1NghWNhQeEEINDcSLMrg+X74HV1o0G26DM76RV
         iFF+jZMKCtHKF+ZwbemfArCFanuJSxJhCUSqken/bED/g8r/AWML5b/oZybcNy7zFdoU
         lu2Iq9i0SUfYysKX1MlQhYCnwNN57tdZWnLTlMAdJ/RZv5g2AJqCXLizyjN7lxVDNpVd
         p811MuZ4nlrwN7glIXoLhYV3UjdK8VnLLLMUlF26wi/pfYcmsiDkZKXIPR02pru73eXW
         3ShNa7rUUgCQrInrw1YT1pNGH9hOGZwkbRLkboVsaW1MVjNl99gCA4Yzwke5ES4hjGi9
         s6GA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772607430; x=1773212230; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zyusLvJCkkWzcJR88zYJ+rt6lxear+OrQKoL1DsRYO4=;
        b=iW91YSGpDvmV48o9wUkN6flMOewBn/AuLdGbrSI7jcZ7llKNNQ84FSgx8QN98wfkEp
         J3bVIhaL4idlB+KvxEKhr4G0oTU/aHbP0wTZahUv3KLhoH+smWn+1K0qAEU9MdV5dII2
         wLJ846P16D1Rb/4W/VUeH9UI+b9yD9dNogrzVFciRFdIpSDLEbcupI17/lus/Mavn9o3
         1IJSCOTS2F4uJgYFyMSnMxOgBjpXPBIm4jHNx7mJXNpk+idzhDwuHqFCScMwejGnja12
         bwvlc3IXVMaffTtqgdPJ35ApBGRmmNHVlCFFRc3ERc0Wtc8xzOYqj13HXUq0vbotQ/is
         vg6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772607430; x=1773212230;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zyusLvJCkkWzcJR88zYJ+rt6lxear+OrQKoL1DsRYO4=;
        b=sqgIudZUyXlnPsKFkTi9nnZraGKZV0Qc3uuM+y25Ok8z2YgSRBYDnzzz1GCfn7nxRA
         gTyxUc+D2Qa2LL3EOvlHCFhwiH0onL1xy+PBxCpU3eUNFAUHbcJxH6mKzGuc5HNdYEg5
         wCvYytNAe7ycpbC/u2JQqpafABXwDIMALs0kN5OKH4Wjfr4W4HScldj4NjeZ9b52spMt
         gfxvvEQKaitn6IkH9NIv1KAJ/x1cq36qjs8E+tcG/6DxtvSX8F5dN5dqefyIvBPe2oUi
         NU1foQn2NXsUAiMYzLjTDmvI2XRqZGRtrJjS59Fg97/M+FlN9NKSyPDNYA0OFnMurCyG
         LXBA==
X-Forwarded-Encrypted: i=1; AJvYcCVOkrJLJuU6rqWUSZOM+sMgBUlQjaZlgDeeqKVM+p8GOvHnGn8m0SUHvRSPOQsPhbq8m106VlwmvRXb8w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yywtjk5uUv1x8CIkjJ2+EJBzYdrzaf6wx81lU0Oz9EeO2CEhG9V
	k3TMBJnQVu6rn4qtgpYQ+/Kcd41dB/NnHXqZg9yPwXGi6rncEDAJbI3LHjuzuCKP3hL4TbGjefc
	CUG3oAozgrDS4R6+3mtF6+Re5efU7FMU=
X-Gm-Gg: ATEYQzwg2MgIDnqUHagW1DeL9hHGZOLOLbQRqK5F7uHWC45NTLxNVRMzRL8u44ZviKX
	HEKziTuxO7xJ954i4GCattQoELYyozk0NsvpU17sYKMJK4d5FHodbf9BvrnoxNBeyD5WLHZApKY
	LVQMeyEqEXdqUMZW/7OSrgaPDZAb2lS7ddSos5s2lyguI+3RuR5d1xQoqOKXzcYYGfkkCM1zsXX
	XMYlRtCl9V0Kg7MxYy55KA5owIsCufYOsg7q2n8Lpew2tXencLsIOhE6lVe2dDU2hBV3+V7vxQS
	mNHGkax79aCz8XoZWA==
X-Received: by 2002:a17:90b:1d51:b0:359:8d2e:6f79 with SMTP id
 98e67ed59e1d1-359a69e4ceamr1142608a91.14.1772607430572; Tue, 03 Mar 2026
 22:57:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260212072229.3247604-1-shengjiu.wang@nxp.com>
 <20260212072229.3247604-2-shengjiu.wang@nxp.com> <d823ad90-c62e-4960-b012-5e7ba1f1b0d2@sirena.org.uk>
In-Reply-To: <d823ad90-c62e-4960-b012-5e7ba1f1b0d2@sirena.org.uk>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 4 Mar 2026 14:56:50 +0800
X-Gm-Features: AaiRm53fl0cJUERzYVac_QaueGqI1pQblBfTQEc26hH-1qPCv-Mn0sM8TTWiYJI
Message-ID: <CAA+D8ANdF0vodObzWA678cTex+y=7zerkQV9AY23KQnzwji-=g@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] ASoC: fsl_sai: add bitcount and timestamp controls
To: Mark Brown <broonie@kernel.org>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, Xiubo.Lee@gmail.com, festevam@gmail.com, 
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
	linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 3, 2026 at 8:25=E2=80=AFAM Mark Brown <broonie@kernel.org> wrot=
e:
>
> On Thu, Feb 12, 2026 at 03:22:28PM +0800, Shengjiu Wang wrote:
> > The transmitter and receiver implement separate timestamp counters and
> > bit counters. The bit counter increments at the end of each bit in a
> > frame whenever the transmitter or receiver is enabled. The bit counter
> > can be reset by software. The timestamp counter increments on the bus
> > interface clock whenever it is enabled. The current value of the
> > timestamp counter is latched whenever the bit counter increments.
> > Reading the bit counter register will cause the latched timestamp
> > value to be saved in the bit counter timestamp register. The timestamp
> > counter can be reset by software, this also resets the latched timestam=
p
> > value and the bit counter timestamp register.
>
> It seems this makes mixer-test deeply unhappy, spamming lots of:
>
> [   56.466460] fsl-sai 30c10000.sai: ASoC error (-16): at soc_component_r=
ead_no_lock() on 30c10000.sai for register: [0x000000fc]
> [   56.466469] fsl-sai 30c10000.sai: ASoC error (-16): at snd_soc_compone=
nt_update_bits() on 30c10000.sai for register: [0x000000fc]
>

Thanks for pointing it out.

The registers are volatile, at pm suspend state, the cache_only is enabled.
Then regmap will return -EBUSY error when amixer tries to access these
registers.

Looks like for this case, I can't not use the common functions
snd_soc_put_xr_sx(),
snd_soc_get_enum_double(), soc_get_volsw().

I need to define my own functions to check the pm runtime status, to
avoid accessing
these registers when at pm suspend state.

best regards
Shengjiu Wang

> into dmesg on the Toradax Verdin:
>
>   https://lava.sirena.org.uk/scheduler/job/2518775#L2238
>
> I don't have results for i.MX8MP-EVK since I didn't test it with the
> fixes from:
>
>   https://patch.msgid.link/20260205-asoc-fsl-easrc-fix-events-v1-2-39d4c7=
66918b@kernel.org
>
> applied so the test ran out of time due to the time taken to log those
> issues but I'm guessing this new issue should be reproducible there too.
