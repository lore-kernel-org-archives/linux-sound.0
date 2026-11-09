Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794197297;
	b=oprR4+av8lE2Zs5WJQGBLbVpFZWRTDflAYhuV+RexyRibkKhoSwPL1QvBj2T70mT93j/
	 yVg2+tp7BZey3QQ7q8yUDgjNlvdzjWmbCbHKQlbuQhU+2APafoZlsZT/fNy+rENecbJjO
	 WUhm1IQzP0We+8amT7r9HbaIB9VFh7bna+1VjcQiRBUzfY7xRg9Eo1/NB0VyCVtF8pAuD
	 12ctqRTFj9G4a3kZX9ovsQxFCHyu0OGqOiLaCEjk+3AKDA6HTxR1/lDpO36OgEKH3vnMn
	 h+cq8EogPNJIdixx8+n4Z/WhTE1+j5Mh854YUzNQtpPI47iMrHKhWFEV8Szl+nlDduQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794197297;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=0IEY2oUkY/Exy20gttekfGAPLEe1995noJ1eoGIVUGo=;
	b=yk/JtgbD/Kl4rBoJrv4YQ+Lr252/X4GGct6O7S+ulO2IL7QPGQqmU1O7Tudviv7l48+9
	 +xVPTX2E0Yp9yirnvlY2Z1v8FCWjUju+hCOclzl/VHTMzW4KORQ30rspgPCJv1AOtaeZY
	 M0V4NZxpUnzM508vnXYWUJSV7jNMPJ90oXELs3cri6PqSBy3Kz4afYeYvnn6LZ54890t7
	 /nYdDSCGkDXfcALtFuzRkYoA8Cxy13TcyPDKb/KAJtXBverwlPmdUPeKBao3oKB45g7J7
	 ++JAskF2CBGGVW5RgJS7GnYpAG61zU/sQf2sIWSW2SjaGxmLeYOJdyJ2pj5dxr0oEBA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="GgVf/4/n";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8F9606A31C
	for <linux-sound@vger.kernel.org>; Mon,  9 Nov 2026 04:08:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A8F9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GgVf/4/n
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e96502e447so3953575ad.1
        for <linux-sound@vger.kernel.org>; Sun, 08 Nov 2026 20:08:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794197297; cv=none;
        d=google.com; s=arc-20260327;
        b=Ug+vcj31iPG3tD0RYlZ+QFqHami64UuVKAs1oh2R0SQKxX9J77tlxJhy4hsDpqOz0k
         +EekRK1BKgjqifhPZ0y7th7sRx1Ba++Xs2JzBGPV3Vpq9yeDbg+usFt4rGTDI0G0PLia
         cWrcLT2uLAKC9iFwn6hFdX86g458LDoP8SGUkAiwDh4VDyXnsYk4SNRxZ4xsYyry+hiV
         lkWmxYIi7Vb/u9d6bRVVNZElYa6JeaQxUX1/iCIAXvEZ25LqCLiZt5SdhdUeszBCyDvp
         Y3tYcGGm1QuvBDda6gOqT0Xf0BC1IOQGEwu6QBrM1ez2124iwCfJxaIfIf8grcMmwqrR
         UGkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0IEY2oUkY/Exy20gttekfGAPLEe1995noJ1eoGIVUGo=;
        fh=z+UIs772TefHkvEZfcEJk50u6nGerYiG64HV+x1dNlc=;
        b=QpZ8oACvVQKuHVsbZkslqJ9RTMI+ve7Jg79u1/isRTPneoxfrYD9LIax32w3K603JT
         WRcs11zxxNO/E83skdwFRKMc6ZpCag1D14YmeAUqFKSSaE8OoIKM7jJUIFH4XkCT4g6R
         mf3G6tV7HQH0k+9Luc9d6AFFFeF+ZChRVh7EFk9PZM7WbgbY7Wb//eJnU9toeAf57+Gh
         iEG5nbR1jamohuVFaj/EkwGzXwVV9o/aNqoBDUamkbpAg63qIyxeWHZ0c8j+agpGSqe4
         FvuFRIqICs8UTvlApQySKxjlNVgGy39O+95U85s23M9K1B9G3pVWTYD1Y0WkKZkw+7YH
         3b/A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794197297; x=1794802097; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0IEY2oUkY/Exy20gttekfGAPLEe1995noJ1eoGIVUGo=;
        b=GgVf/4/nZUEYCjXLUahSJmuRKKDNEuo19fTKCK2nP1iK9CnBNQFR0oKzd1ryRPzz8v
         xbDK147jH6g3ALj6v8D1BZnXQE26G9j7pPwgfGEQsdMymlTKMcaawg5Zyxv3FhOFrD3z
         Ma6LTQiSeZUc2AUiA1J3U4Ik7AveDl2gMgEjD7xOSfEQEdfNmgls3TPVqIp7aw/QF/uV
         ytKin5PqawfI+bXljt2cG1TapEbPlMxq9ejx8NhX0Ss+Qlk7reBij5FZi+SH1HWU9ouN
         Jw61ZeCQPPIBWX22iu94I8Ug3f1jFqTlwfvJjCme5O2gf54fwqPb5m0DUJ3qCLNVjcrM
         MdYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794197297; x=1794802097;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0IEY2oUkY/Exy20gttekfGAPLEe1995noJ1eoGIVUGo=;
        b=LE3yLfnCjVQ4ZDafzFDcagTxZ49uOtoaK7G6Y+CLgiUCvyPgDVpR0n0JwfysjelcFN
         boGrtvANMULM8WQ6RYsfno0tGGA7sjDiWhkcY0xhGcAW4es++6fCoEX97CKLpREFKzXj
         +LbJdmMRTJTr/B4gt+tB/LMmEP8gdVzp95zZZjkN0sfR4eaqgO+bsEI09lo6kq9MRgH+
         xpgtCZ6jhBXRB7maG/zQlCsn1TTsYVGSSeCouOUTfn1AaNftAxrNOccNdMNThT+O/DHl
         dZLltS6CtUwUB/PRid3sZDy3rrdmYDvLbLPeaUKqvExuvUEukQsObn+7P1VCAqfs48k9
         CFyw==
X-Forwarded-Encrypted: i=1; AL+hErEqwYq66uXZyqurAASuDl0RJrTUUZYlMaEV8w9p13nW0YybKPajpSFl/znL0b5zH3Ldt0PCpwqM2D5+Fg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8A6ovtstKAZTIlBW+o8g+8pMaPrDtqRG77X4/QwHvWDVBac3xH
	7zNaXJKKd55Fxuv/pHamzmW67oTFAIhd7EaJDJdahG3H8DaKByO21j7gisB9k9EzhKQAf4tosJw
	Q3VDWsYVA+inSsBTolzDs1MJgmPnuiN8=
X-Gm-Gg: AYBFou1dWZfSsE2arWQNrICohv8Gf4FyoSjskS7FlynP7ZHKnwNGj4DRTv94Zm245hX
	tOzpsepfpc96vddGVbOIAUZr65MPY5cMfBm01BvBIG5gYSS8J28JcFWMkfzf3KqaRQYfLjhBO20
	i8YgtycrCz8sDaGMAHRup+QHecTwD5y1CXykTsTq0lDqgt+moqhQXHg3C/CnhvbN77WsWg8wCdZ
	FFGbiP+8mbyd5+QGJA9vSX16wDsQl1kA/lwMGsH/mFTV9MAPrrCXEkUP7N0CwZ3dGxgtMm6FGzw
	ShcuMruC5Ds/+pQyqbXp0qUIzedjCAQxih/t12U7dZpeIsgzF/qfhyyqeoMGTbSAEWHewNb133i
	dh5NfKp77LBv9NixggpPqmgAuhfE/UATnEqYHLe4dkrE2qtF3GI17Q6Znmn4T31SVwOFDsKj3oc
	wNYDRWUBNMnNLsmsE6JB5v9A/VjGDkllZfwfwFfTDiUdiZZhQvMowaQt/wcvTcEQUO4wPMGQ==
X-Received: by 2002:a17:903:2a86:b0:2dd:ad73:c938 with SMTP id
 d9443c01a7336-2ed8377272bmr30112565ad.25.1794197296668; Sun, 08 Nov 2026
 20:08:16 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105104237.38542-1-phucduc.bui@gmail.com> <20261105104237.38542-4-phucduc.bui@gmail.com>
 <179397468197.3073895.1522608204443678480.b4-review@b4>
In-Reply-To: <179397468197.3073895.1522608204443678480.b4-review@b4>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 9 Nov 2026 11:08:05 +0700
X-Gm-Features: AclHuK-zMhWEuwFpd7MBkxqEDP76pBnSJIU10D20h7lMcoXH_TQWFgwLNT2WA4M
Message-ID: <CAABR9nE52Rk81oyoM3L5hHRn3n9OCP3PWSxA8nNt+aEPoeRtqA@mail.gmail.com>
Subject: Re: [PATCH v2 03/10] ASoC: fsl_sai: Remove redundant error messages
To: Mark Brown <broonie@kernel.org>
Cc: Shengjiu Wang <shengjiu.wang@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>, 
	Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
	Nicolin Chen <nicoleotsuka@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linuxppc-dev@lists.ozlabs.org, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Mark,

Thank you for your review.

> >
> > -     ret = fsl_sai_reset_hw(dev);
> > -     if (ret < 0)
> > -             dev_warn(dev, "Failed to reset hardware: %d\n", ret);
> > +     fsl_sai_reset_hw(dev);
>
> This is the only caller of fsl_sai_reset_hw(), it could just return void
> now.
>

You're right.
I'll change fsl_sai_reset_hw() to return void.
Since this series has already been applied,
I'll send this as a separate patch.


> >       ret = devm_request_irq(dev, irq, fsl_sai_isr, IRQF_SHARED,
> >                              np->name, sai);
> > -     if (ret) {
> > -             dev_err(dev, "failed to claim irq %u\n", irq);
> > +     if (ret)
> >               goto err_pm_get_sync;
> > -     }
>
> This will only print an error for a subset of errors, things like -EBUSY
> will now silently fail.
>

From what I can see in the code, devm_request_irq() ->
devm_request_threaded_irq() reports every failure via dev_err_probe()
in devm_request_result(), so -EBUSY should be printed too.

Could you please point me to the path that fails silently?
I may have missed it.

Or did you mean fsl_sai_read_dlcfg()? It does have some silent
-EINVAL returns.
I'll restore that dev_err() together with the fsl_sai_reset_hw()
change I mentioned earlier.

Best regards,
Phuc
