Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C08C264A97
	for <linux-sound@vger.kernel.org>; Thu, 11 Jun 2026 10:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781172978; cv=none; b=fcuNX4SfLyxitUaqgUOzEr6dQQCm3a0BHzOWugGObZ9a7jCW2Ycb2l5t1WnbsopS4AacynmeW7wgeXp1nEcu7cQXYaY4Gb77uQvLHB4RtTwYySBaeKL2V1nk8f8sZUrDVUFKOuNbRTcXWlnQzqb9qQOX6eNVtISFUyiqFRBOsmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781172978; c=relaxed/simple;
	bh=rnRpWmG4J48ZICobw97cnDsqPP732sbLJJ65tkBqeIA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=QGYgjCZJv7LnhVtNylrJENZ1dlZg82Gj72/zqWeyCwV+oxnRjRkFJqIRMb8cpaDADfTaPXutJ1H4Z71We3CoxlM85+xcQeF2MyavJR5XoH0SFRN2rJW3vam+mvG30LKVnZDL8/WRQtLTg/+ksQmYt5jeBnOXMGk3a6xWpBhK77w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=G69zae+J; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="G69zae+J"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-68c1630159bso8840318a12.2
        for <linux-sound@vger.kernel.org>; Thu, 11 Jun 2026 03:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1781172974; x=1781777774; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PhJd7zCUXuRcUedlV9DBkM4yrOANKOlgS/yqDuehskQ=;
        b=G69zae+Ju4pHWOEwD23d1mRyH38is151jX/CezTDqRVv3gOUkTnhdclFRM6XeRHpix
         w6g+APpYd1G+cXckv2l0Z0+KFgmvnZ8cZNkzCswJ3ksYOGTMKHA6ylxgnvLLVznzmEAz
         +7q7hqpINdptlgQnv4LU+HTPHnS9anEQjpN5f0D3iz8u5ZclpgdgNtLsnqKH1+j3vVrP
         23JqOqtGeNW5Ef7isjufuKrq6P/qS5p9qTix63+uEDiM5y0icnOr0QeLI4OZDMRUAov4
         8yq7Hb7HniZTFKh1piEsTwpAr+xsVjjGcdJYopiXeTp/QcD9TH0+f7Iym9wAxiHGUkMG
         bqGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781172974; x=1781777774;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PhJd7zCUXuRcUedlV9DBkM4yrOANKOlgS/yqDuehskQ=;
        b=jhqPfmaiqwNx0Zlc1xCZxOX/pmdzpbm1ICOkr0OllmNNiTuaz5eJXwzH9s8u6oO7it
         LNWk++a0ViTsPrXqdIGOsohFca3ijhSysk0KA8ALleaZru4LWHoOsJoMjFK2ziHkmlP6
         q2L/ttjjvXw3MK9Fi3TLTsyf8207XzQO3aVpf1LYn3Io4Fmz82sGQM0rXr1FUNuTdic5
         HD2LUPwzHqIeJqeBpYdfEnBzUDeQsrU1CTPk4WaTEwxLUXcsgLgjeinWnM8DORAtRRiD
         4Y3EP8R8NEqZXrWW8B5Cj2tdP6dP7yGlcPc7E1NXPNe29VAL4AF8gqw5qTuHJnTc+LQI
         vsuw==
X-Forwarded-Encrypted: i=1; AFNElJ91HR/+NXdYwwohYCYyCEZAxkFLy7w0LJBy58UjULmqZ/g71DTgocWhIF3QU6cNAChhqxX7fb67B4F1UA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzbPPecAuxgorLdOYStCH4OWx+k+5GyXcCCf/w+YmXS8KKafaQ3
	jw7of9GapGZdexXVy1L6GBX2xmEa2ax/ALqsd2zXt7AHsv0sokcqpwGc245V1FwInPk=
X-Gm-Gg: Acq92OH5zcKKDjYwG0kTlKkmxD+EINlyJhoUgpBaez/2SzNXbVPmEinOFlf+rU/DkpA
	gKrk9O6C9fhDvI4Tf4bww+bxmSGSTvSN4RDt/egUrsX+150VyraQm0DG6AlkPuJurUpbeTYMEG6
	zLIH97qu21QAFNV+rxE99+OW915Dc4KldytyiemcXmnTmd0GE9GsUKTpmDIcl5uBCMXQIFHqMjn
	lxiI78Zz/MMxjQMjj1p9qJzCwaAbvvJHx8Y0bqT3ifPxmLI+njodPob4RVrI70K/etAOYPsoyQi
	TnbVT/5efF8SNYd/qrBsrcZ+/2WCWMHakvTdgvAjSYtuwHpkgrsQl1++HDlUzFN+VtfU63lAyt2
	DhUOKPMhJsXo9xguPMtEQVCjcgz3DKDFnGy1ybGE8z5dZcaxyPqUYlUTUNNN5wwndn0M98GjJ3Q
	s6IwwnSpLf/DTGPvoYZSVNeS8CV0STkoy+YCs5XTMzImw4c/Nj60S3h5oSaOe7tJpeWdhCELlpM
	gkdhGc=
X-Received: by 2002:a05:6402:4405:b0:692:4761:989e with SMTP id 4fb4d7f45d1cf-6930e2e5988mr1051968a12.13.1781172973893;
        Thu, 11 Jun 2026 03:16:13 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e65851786sm10571626a12.17.2026.06.11.03.16.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 03:16:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 11 Jun 2026 12:16:12 +0200
Message-Id: <DJ654FFH3T09.1VKAT493JUWP3@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-sound@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ASoC: codecs: lpass-va-macro: Fix LPASS Codec Version
 for SC7280
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>, "Luca
 Weiss" <luca.weiss@fairphone.com>, "Srinivas Kandagatla"
 <srini@kernel.org>, "Liam Girdwood" <lgirdwood@gmail.com>, "Mark Brown"
 <broonie@kernel.org>, "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai"
 <tiwai@suse.com>, "Dmitry Baryshkov" <lumag@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260526-sc7280-va-macro-2-0-v1-1-2c1b572fa388@fairphone.com>
 <311ceabf-23ff-471b-9553-797c7d76af74@oss.qualcomm.com>
In-Reply-To: <311ceabf-23ff-471b-9553-797c7d76af74@oss.qualcomm.com>

On Wed Jun 10, 2026 at 12:52 PM CEST, Srinivas Kandagatla wrote:
>
> Thanks Luca for the patch,
>
> On 5/26/26 4:03 PM, Luca Weiss wrote:
>> According to both the static definition in downstream...
>>=20
>>   yupik-audio-overlay.dtsi: qcom,bolero-version =3D <4>;
>>   #define BOLERO_VERSION_2_0 0x0004)
>>=20
>> and the runtime detection:
>>=20
>>   CDC_VA_TOP_CSR_CORE_ID_0=3D0x1
>>   CDC_VA_TOP_CSR_CORE_ID_1=3D0xf
>>=20
>> SC7280 has LPASS Codec Version 2.0 and not, as declared with
>> sm8250_va_data LPASS_CODEC_VERSION_1_0.
>>=20
>> Create new va_macro_data with .version not set to use the runtime
>> detection and correctly get .version =3D LPASS_CODEC_VERSION_2_0.
>>=20
>> Fixes: 77212f300bfd ("ASoC: codecs: lpass-va-macro: set the default code=
c version for sm8250")
>
> Can you help me understand if this change was fixing any issue, if so
> can you pl add CC stable

I'm pretty sure that just came around because I was looking at the
different parts of the audio stack and trying to figure out if there's
something wrong somewhere, and how the different versions floating
around downstream & upstream & documentation match up.

I'm not aware of a situation where this change makes a difference -
apart from the dev_dbg() print.

>
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>> I'm fairly confident this is correct, but please someone double check
>> this if they can.
>
> Yes, you are correct, this is actually Bolero 1.1.0 Version where things
> have changed in codec. if you read major number it will be 1
> This has been artificially tagged as 2.0 in the driver.
> So the change that you are doing is correct.
>
> Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

Thanks a lot for checking! Opens even more questions in my mind, why
1.1.0 =3D=3D 2.0 but somebody somewhere decided that at some point I guess.

Regards
Luca
