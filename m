Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794554314;
	b=4B6+hTsbrs8zFPcgylRmwXUeIStrcsugU2R64BU6dJLS9g5wOvsv9Pys1Yo14SapU6iX
	 bM0Lsay3l5JnJeTgvdLTc73Uwjvw0COh+IdSRTF1TDVHcqgOvnoubcTsuyvnAojsI3F3f
	 oh4Ac0p5GPKe8vDXMKowqKVBOnjizam9Lgtkm/pGGo1SVJ8bCbz4XIpztVLG2TxfUKeiI
	 8ca80caM+rf20fr44geUHYRMfnkQm2Ib6Vk44HVfJ+82AABEPc28VYrKwui6PHo7OLugS
	 rGvmka3/gcu6aQ3RdjmumcGS2O/4T9frQzZnqzQjIPBYDxbz6rfM3lLlrJGjMVu41fw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794554314;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Z0+5b90eI0XV3LtvO+5dJ8DLir8th8z4fv/7Ku1cttA=;
	b=g3SoBJadf49A2E0omEB3NnjH94PpWYRsa656gxhg81lLEREcGGh9zaK+Vns6GMurfhWN
	 kJ95bxJPr+VT99m9GMJH5YctYtt8v9VIcTx5aWG/2G7Z8elSPqKcYgd1sthe//VO37Rma
	 uhJqP1uA9HMPsdeLGZwpUu2fhB1qxWK3e+MiTScNwIxtSk0R8ZX2TsnDLF1jDXUGnTYoR
	 Ooue/D4GD5wNRsgxTXYu3sq8TrjdsJhCRnmAR6DYUoLBtf/+Ahm5hIyPZCVR85bsp/9Zn
	 NdBiS3DITdXLUOoNLLah6nHV6OsGWcyBNugrLj6a7+pzVmL4JEvVSCgFwF1XqTxc0eg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WZ9FO35Y;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46976606A887
	for <linux-sound@vger.kernel.org>; Fri, 13 Nov 2026 07:18:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46976606A887
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WZ9FO35Y
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cdab9e9761cso664071a12.2
        for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 23:18:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794554313; cv=none;
        d=google.com; s=arc-20260327;
        b=LhigeRuEkmqiblO6KLt9YdgQQqilSnPl7/fi4jhrGvZbROYU0O/WTLzEozH2trw7iM
         IgjXmt/wUBZ0/gKKP3CuGDmjQAjhTwp1i55ysXqUaPAGoqAR+CFIrb7o+T30s/swxIR/
         mhm6pjBXIwvOPyxTaC3hTELINB+GjSEsrgE3MUksOQI4df03ZwLwRlT7pf7j65fLX2Uh
         5Lr6MSXxfSjlCwA59eGX9W6mK8id3+fH1u/+Ux2iPMWoTR4WzwyEbch06Yrcb9aZnYa4
         OIPMcuqFKujfhe2l7QEX3BQJqx2bSbKGxOcIhfpKxvOqsjaJsk5Ege2dcESS/ENHDtZ2
         YxpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Z0+5b90eI0XV3LtvO+5dJ8DLir8th8z4fv/7Ku1cttA=;
        fh=RPXlrIhphW0ejLO+ICD8IUkRFjWe2goTmxanotP6ssE=;
        b=X6Ut/vd0gPklbLMRuMaYejXYjYueTnIYWsFbR6lyVj21YLQhnjiLiqj26eQIm6Tnxu
         ieUGGFj0MUiO6ioIYy38WC3FKSFcaocToUs5P1mw89hajnsx6kD50h6+soh+Fg4AHmDu
         VKqP6mRlTcVnIaWE21378bWV8/MAcADRCzVyJfzEu2i/CRAvZQlRMVDys7Yn8iXulKpu
         pzvwWH883Y2bdxWs35m0gz9wwndhEKhKtleqkbHbPMnYxqZU9GleNpZTsU9frzLmTWZO
         M5C2wXxY1z0yCCuQ/Aivb9HZUpMRYoRaBKfxid6x/S7nRU623XNqhy3ZQIg4jye62LrM
         Fhvg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794554313; x=1795159113; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z0+5b90eI0XV3LtvO+5dJ8DLir8th8z4fv/7Ku1cttA=;
        b=WZ9FO35Yj2EGZ3glSIiD7E702fDDmutFYe/FV68QwbfJ0wErGMDSFndeI7bUHZDuzH
         1fsYwRhy01PCTAZ53snqly4ETL177Q6fAb1zukxr9mnZIqSUxcUmJ71uejWVdqHG0Nq7
         /lpQDQLbShA3vJ1VnMKScc+4zSGJUWM3NDuVI88nxRKAjjGUFPZL1QK7AcFAmxsbmum3
         bdsoNqk9m3VURMpsXuePx39UEpio5rM5gGzf05GSyI5ikPaaK5Dyrp1jKBbilKZGvNIW
         24fxaCAL+apzDOsnsYWvvsYflSmJzykcU3Ek4ElMPIZX4i1hmfsL2ZgemilttfVUcSuA
         shCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794554313; x=1795159113;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z0+5b90eI0XV3LtvO+5dJ8DLir8th8z4fv/7Ku1cttA=;
        b=oEJOkcP76WhGvJDcmQ3eP3jEmLGUBa/WnyWU1y5oAZ9dxERbvb+ZBfy5XYPc7/gJCy
         Jvycubg9UkSKc2SSk+3lJCqkZ6rr69TqqUO2IlQg1I/VxcFFKcOr5X6w6hfsWyo8hWQV
         E4wNu1MyvnhhQiAOpr8oyztmHyVYok1FGMbjDMkW3FGbcHfzEk9G/dSSF7MHKBagA0Ae
         kaKbjrSRpLF976P0DMsZ6vS+nzae8a71wdGcxjQPsP8YGjQagtA8aAwUNzmg8uX0N5wd
         UcLTBiGOVAU6LvXAmNTelavJChJRSEVPOAlBN3W8HFVVEt7Jh5x7PRk+YEflVe6UrGej
         528g==
X-Forwarded-Encrypted: i=1; AL+hErHJLp9GhzSfO+ZCCboz/DCXmex3Wa0m5REUP9sueotfN3aKd+nJALNwrikwRnLkb7If8weATm6Ou+pX3Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z8RGt1TdeQFyoUEZ3V1jGwYFcT7hOI3bfnoWPWHlkdNRZqmQbQ7
	9xmGtAqLOl0aeDSwMbbJxBKruc9YJLBXQ4A3k40ui+aWUxZtQPaqve+mO26IVRQKGyXtRv6msO+
	Bps5+oipws35NaFqz8BK6gbx+LRh2TUY=
X-Gm-Gg: AYBFou0Xwud+Vh4rmVeaprpDP71Ompe6Vq+LPporTFN6OrW4wzBRtL8vMZBJevgjQE4
	ZabPfIjJ9PZxvvjXXpI8CkeqRjMlk2QX27M1GkqaL4b4X7vppYVyeN+8slrrIfrzlJK/MqAY7Q/
	eOgNpibzzGaNbfH3WC5mzJ91rMaOKqLK/EVQ1IAOqR/s29dRHvwnR8z7iYtGw92F4aU+JCHXyzu
	VstXnHdj4KEAbtOmwjAtS8vOPrWWyTNdU+z104CkGgJ4w/3tF9TekD5lwl39EacIRnf/h+3A+7G
	F5dOlbG9m91BzKTR/Vu/7zX3zSB/Nr7uarTo4xpBBDNqB4KpufipLrCHVplxlVr2CfE04eElklw
	dGswLnZG8XPP1fsBJ/tzhrKjq9M7WVmV5BMS0
X-Received: by 2002:a05:6a20:430c:b0:3e0:f8f3:ac70 with SMTP id
 adf61e73a8af0-3f7a7fc6dc2mr1584952637.61.1794554313512; Thu, 12 Nov 2026
 23:18:33 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110075841.12104-1-phucduc.bui@gmail.com> <20261110075841.12104-3-phucduc.bui@gmail.com>
In-Reply-To: <20261110075841.12104-3-phucduc.bui@gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 13 Nov 2026 15:18:16 +0800
X-Gm-Features: AclHuK_pBW-2Dpv2BcGIOJH5pev5KvmpGX7HHdiyRgy9dTc9bXL9f134N_0U2VU
Message-ID: <CAA+D8AMP=4jc-_Nwog5vqw6nsxjpniy_Rt0xy6ca8d7ko8MQtA@mail.gmail.com>
Subject: Re: [PATCH 2/2] ASoC: fsl_sai: Report dataline configuration read errors
To: phucduc.bui@gmail.com
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
	Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linuxppc-dev@lists.ozlabs.org, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 3:59=E2=80=AFPM <phucduc.bui@gmail.com> wrote:
>
> From: bui duc phuc <phucduc.bui@gmail.com>
>
> fsl_sai_read_dlcfg() returns errors from of_property_read_u32_index()
> without reporting them.
>
> Add a dev_err() call in fsl_sai_probe() to report failures returned
> by fsl_sai_read_dlcfg().
>
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

Reviewed-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Shengjiu Wang
> ---
>  sound/soc/fsl/fsl_sai.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
> index 59c9b8c28133..16197f9ac2d8 100644
> --- a/sound/soc/fsl/fsl_sai.c
> +++ b/sound/soc/fsl/fsl_sai.c
> @@ -1621,8 +1621,10 @@ static int fsl_sai_probe(struct platform_device *p=
dev)
>
>         /* read dataline mask for rx and tx*/
>         ret =3D fsl_sai_read_dlcfg(sai);
> -       if (ret < 0)
> +       if (ret < 0) {
> +               dev_err(dev, "failed to read dlcfg %d\n", ret);
>                 return ret;
> +       }
>
>         irq =3D platform_get_irq(pdev, 0);
>         if (irq < 0)
> --
> 2.43.0
>
