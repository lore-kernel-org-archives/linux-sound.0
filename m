Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6913381AC1
	for <linux-sound@vger.kernel.org>; Thu, 15 Aug 2024 21:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723756039; cv=none; b=Kl6bqaSNWnaIA8Q6Kd1sz+9XYlkBVCRpj8kmy++oifomhLPav98rKOgs4ZxIWaf7GTcvUlS/3TWm+WFlW2Hff5grSoM2xaJDXoEF+HF4F13f4xdBpNQU+nLjDX5TCP1+LhsIvEKRhji8XaaweRf1AohEOCnPJZ9A04CiOJK7vzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723756039; c=relaxed/simple;
	bh=BF3urCbPeBeol0sYlYbUZi+Jf8OHyrb/Wi3RqCTay40=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=CEUrXxH+ApvIZb3NTUNjI8UdbQpGEMPlwNezAzGpygrq/Mj2rwmoBTBpZmkDZvQq3IIUEzJdF6rGCd5VSRRqjc7v9HTvK5iGUQ1cg1ck3l09CP6+nkt1Yy3XLOoK0qZFDW1npUjDP3jnr2ltVT6wZfNihTLHoqrDrTNfPLWWabw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Qc7iVEDM; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qc7iVEDM"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1fd66cddd4dso13594765ad.2
        for <linux-sound@vger.kernel.org>; Thu, 15 Aug 2024 14:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723756037; x=1724360837; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GU3FEI8r9WUvRV8pU1u7iapspQEbMTOJxe92B2n9rDo=;
        b=Qc7iVEDMuL/pk2tjdjsi5aiU/buZyhayyKXPIpuNEnfjgGfHJb6ZEsnO4NVyK4pWwv
         necThe+WKKneQhrfflIchl9HkKGURfE3JXzX0TZRDLuyT9eIJ97xKVgTv+1mf1QGUTef
         sXCrHbztSATnRWNcREHjIMlU4yEm55DIGtLCdIVTTg7ie9cZgQu+Nr5PIGfMKEMIcJCL
         eJJsz2mUepESoLlIpf6R3foe2KH7W5/ajN/0/wvuZczEkAFoQRKLUccMrnQnXm1nIhVq
         b7xiO2HVs/sfn8IYUl6yhKkfho7jHjjxF1WUBvzEbWwc91QSiTkk20ELJFpB9xTe1Wol
         jI9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723756037; x=1724360837;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GU3FEI8r9WUvRV8pU1u7iapspQEbMTOJxe92B2n9rDo=;
        b=uXm7SP9c53GPqoocH5EPaRog7XFgcMYJ5J/Nz5jpO3lDQnqazr42Au3PyRvzHb3P50
         8maAckMKlvFP4AaaBuFaRvuMCEXGOXUts4TtVwe6880F99iwxdaH5WKrl+9wdYFfmbZG
         Z/ONTQpG+gesJp7LN0FrB1BunGYOLyC5Txff+m4KcVAAG8qiHn99H5hZg1INMgiTF9j1
         urYW6po9+vBSeOagro7rjV5/7yW1Iecn92sVq9+AIbgFoY/uX6hBDbiTVUU6FIYfp4lq
         0yheZkM/nQ2jPKZlPuXglasr+vCix/dH6sKEIJ8du+Oi/agULxryR0x3nwg+QZrTgltU
         iYyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVk+Xf+2uH2DmqCvSPS5FJxDlrKv5S6AXU4jEb7fHzo/ccGay3iNbEy84Z0wM2rKW5/TxM8+b7tdMr+p587xL+uv4rY7XKc8+8JchE=
X-Gm-Message-State: AOJu0Ywp/Kcs75E69EHeISAS6e72L0AuZvw+caO9E4dc7QQbJhsKDXjw
	fhXNiSU7K8zBZytnua7lm1q6yC+rllgPXtd7IOMexSb/Bkv/eGVqzgFe5um7wAI=
X-Google-Smtp-Source: AGHT+IE7DC0PuZyrMxZiu7Je33kd+MzL7ueLlGL4l0yPHkA9u6HXMbV9O7yPJEcgT1AyBP5zqIVCbA==
X-Received: by 2002:a17:903:2342:b0:1fc:6c23:8a3b with SMTP id d9443c01a7336-20203e8d400mr10089755ad.17.1723756036599;
        Thu, 15 Aug 2024 14:07:16 -0700 (PDT)
Received: from [127.0.0.1] ([182.232.48.216])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201f039fa16sm14112125ad.257.2024.08.15.14.07.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Aug 2024 14:07:16 -0700 (PDT)
Date: Fri, 16 Aug 2024 04:07:10 +0700
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: srinivas.kandagatla@linaro.org, broonie@kernel.org
CC: perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, amit.pundir@linaro.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_ASoC=3A_codecs=3A_lpass-va-macro=3A?=
 =?US-ASCII?Q?_set_the_default_codec_version_for_sm8250?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20240815164903.18400-1-srinivas.kandagatla@linaro.org>
References: <20240815164903.18400-1-srinivas.kandagatla@linaro.org>
Message-ID: <F07BF288-66F4-497A-A581-5FE4B7B432BD@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On August 15, 2024 11:49:03 PM GMT+07:00, srinivas=2Ekandagatla@linaro=2Eor=
g wrote:
>From: Srinivas Kandagatla <srinivas=2Ekandagatla@linaro=2Eorg>
>
>sm8250 and sc7280 have lpass codec version 1=2E0, as these are very old
>platforms, they do not have a reliable way to get the codec version
>from core_id registers=2E
>
>Add the version info into of_data, so that it does not need to use
>core_id registers to get version number=2E
>
>Fixes: 378918d59181 ("ASoC: codecs: lpass-macro: add helpers to get codec=
 version")
>Fixes: dbacef05898d ("ASoC: codec: lpass-rx-macro: prepare driver to acco=
mdate new codec versions")
>Fixes: 727de4fbc546 ("ASoC: codecs: lpass-wsa-macro: Correct support for =
newer v2=2E5 version")

Which commit introduced the issue? I think having just the first tag is en=
ough=2E

LGTM otherwise=2E

>Signed-off-by: Srinivas Kandagatla <srinivas=2Ekandagatla@linaro=2Eorg>
>---
> sound/soc/codecs/lpass-va-macro=2Ec | 11 ++++++++++-
> 1 file changed, 10 insertions(+), 1 deletion(-)
>
>diff --git a/sound/soc/codecs/lpass-va-macro=2Ec b/sound/soc/codecs/lpass=
-va-macro=2Ec
>index 8454193ed22a=2E=2Ee95d1f29ef18 100644
>--- a/sound/soc/codecs/lpass-va-macro=2Ec
>+++ b/sound/soc/codecs/lpass-va-macro=2Ec
>@@ -228,11 +228,13 @@ struct va_macro {
> struct va_macro_data {
> 	bool has_swr_master;
> 	bool has_npl_clk;
>+	int version;
> };
>=20
> static const struct va_macro_data sm8250_va_data =3D {
> 	=2Ehas_swr_master =3D false,
> 	=2Ehas_npl_clk =3D false,
>+	=2Eversion =3D LPASS_CODEC_VERSION_1_0,
> };
>=20
> static const struct va_macro_data sm8450_va_data =3D {
>@@ -1587,7 +1589,14 @@ static int va_macro_probe(struct platform_device *=
pdev)
> 			goto err_npl;
> 	}
>=20
>-	va_macro_set_lpass_codec_version(va);
>+	/**
>+	 * old version of codecs do not have a reliable way to determine the
>+	 * version from registers, get them from soc specific data
>+	 */
>+	if (data->version)
>+		lpass_macro_set_codec_version(data->version);
>+	else /* read version from register */
>+		va_macro_set_lpass_codec_version(va);
>=20
> 	if (va->has_swr_master) {
> 		/* Set default CLK div to 1 */


--=20
With best wishes
Dmitry
