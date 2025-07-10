Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD7F270EB3
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 14:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752158721; cv=none; b=EufESqD73T/ycJkBmks3csybZjEHzRVWEqQ5c/cQAVFUpZhAT2tsT2aR2cAilRowVFGQjFAq3h0i8RJzX+H/XPxL88aVzZCcoT5TW1IwML08O0qAeRtFsWVquG394NqPdCiY05vtP+0R1sNAQv6cG9M2gvuBD69V8eaTQbz+gug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752158721; c=relaxed/simple;
	bh=GuuXNEIIHpc+OomKipbBSS2eHjtAi/KmN/JAHDNUxyc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=WCzqFfI/AkLdLLqecEZ0cmA8DiCbxV65E7ALJVHCLNORhPuee3h9/Ru/Kwm4lgHVxMco2xDoaVU+3z48N9HS72tQKqZNDlgDWwOAuWwnqFhIBoOAgNxCifp/oG6weH+bhE71fBzGK+yAansTL/gUSit68NTST6Zoows74GZRQIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oCIn/on9; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oCIn/on9"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a6e2d85705so754616f8f.0
        for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 07:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752158717; x=1752763517; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uzpztVBg8Kr6uCTVYsLaqFYuf7mdKz1OXaJIFB3Ydtk=;
        b=oCIn/on9utF4YPok+p2VGklKSBD403Ij+BG8HfSHqMNQJYLJD76XgMAToTA4bJPDj1
         EfG4LoatNTE335CrCfp3k3IhIqD+jiVOdwmtrEOZojho6Q9KgfmE5Pk4wPQqg2xLmook
         VkPK4zu82itBzZJxoP5ZH9ZUXewXdd+FFWSnOL2JpRI4BoXfdLsy/N5puNhZdZJ3XEPu
         rYm/1dQv8k1CdJIBvnGYR5PSQFXvRSpFASIm3OQhw4Qq1W93RpXxq+O5hs//OWKtklhF
         qYdwToupp8/a+/OS4XcZnzcLTtSlwoCW5Dlbx3LzIe+sZBtoygoNEgOSR/DQi1BXDr13
         tPow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752158717; x=1752763517;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uzpztVBg8Kr6uCTVYsLaqFYuf7mdKz1OXaJIFB3Ydtk=;
        b=Urq0eLXd54qdT9k4cACGEA1IDckcQvu5tlmPfNgr8jINxxAWwJ5Q6siGpguRuu82Lz
         fNw1dVgzM46CH/dpwnlzvaq821a8ECjzeqBvUmsI9c3569FUU+Pxfa6uyFwhwq29gDWq
         tXmylFYMn+EEFbfv91ZEEvharDZQYmaoJ8SclY32r8FVysVDW+OogYsJEFg+n8FyhRsr
         3gi31E3t+CtnulR/q0VSrUnfatVqzkNAKuu0shynl4DgqFtrEIS6khys9SHwhFFFN6Lc
         0zPIlCm3jDRQ3ACaAFVltNmJ89FCrP2i1jvSVtFpxeB08nHpJYNZDrDM4FAoFZeH1ipV
         2+Ew==
X-Forwarded-Encrypted: i=1; AJvYcCXqNmqPC6EhFq7exwmqvGgQDXfsvgO2zvzGfgwZxwBpt0eQCuwgl40UfcLtifejDLZhI/d3t5KiqXfItQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLmJeOPdvu5GKoUvioCCjutYMXjNcScoPG/Xbws2mq+Inb5QWv
	Y5hNQBhpcmYcQJI9xl/1S8z3OoEtP7H4MQ/HN+v0UOkKiRpb6aApTMHwcg0zPVNc3LQ=
X-Gm-Gg: ASbGncu1rrkyV3uJ+ztgOkRQ837OXaF3tT+sVNNXCTLrCwBg9h6R1ZW8fLQdVVH4gl9
	ThsjDn2KFoP6SBX6kMOg5ycpl0UbUB9p7frpHuwMTRymrvCoVZXURfneKHug7jkZTIbcI7PtYRZ
	HqhxfSYZ30+UvtZCqiXPHUKOA7976fW/8lrQLLv3XsOghmf9O8G8LGzPxq5E6sTCjkttIQ7l7Jd
	T8V5lC4yLN/U0lyklgbI/8gDQCc26NtCcBqC53a1+heewsQxn83SOxRZ+mfWVvz1do2/JEATQ7D
	T54xogSeeJZUON42K17d1W60H4LvpmPUsSblNtZCuGav9So2eXTqQinilAkVmy9d29o=
X-Google-Smtp-Source: AGHT+IF9BLMRIl1cpwDsXcnH1f3gWfggPdcwbBjL9LEkWjPoKOu+RvwtjCs5eMcSNOOmyzdBY+cr/g==
X-Received: by 2002:a05:6000:250d:b0:3a4:df80:7284 with SMTP id ffacd0b85a97d-3b5e44e1fefmr6408642f8f.1.1752158717358;
        Thu, 10 Jul 2025 07:45:17 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:6c39:59e6:b76d:825])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8e1e135sm2085810f8f.72.2025.07.10.07.45.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jul 2025 07:45:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 10 Jul 2025 15:45:15 +0100
Message-Id: <DB8GFDXKQ6V1.BXX5KGBJP6YS@linaro.org>
Cc: "Srinivas Kandagatla" <srini@kernel.org>, "Liam Girdwood"
 <lgirdwood@gmail.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Stephen Boyd" <sboyd@kernel.org>, "Lee Jones" <lee@kernel.org>, "Jaroslav
 Kysela" <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>,
 <linux-arm-msm@vger.kernel.org>, <linux-sound@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Dmitry
 Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, "Srinivas Kandagatla"
 <srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [PATCH 3/3] ASoC: codecs: add new pm4125 audio codec driver
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Mark Brown" <broonie@kernel.org>
X-Mailer: aerc 0.20.0
References: <20250626-pm4125_audio_codec_v1-v1-0-e52933c429a0@linaro.org>
 <20250626-pm4125_audio_codec_v1-v1-3-e52933c429a0@linaro.org>
 <aF01gRFjsKgy6j4V@finisterre.sirena.org.uk>
 <DB0YYV10UD2Q.M36VAZJOVE7V@linaro.org>
 <af605c12-74c1-418e-9fe8-c0aa893a62bd@sirena.org.uk>
In-Reply-To: <af605c12-74c1-418e-9fe8-c0aa893a62bd@sirena.org.uk>

On Tue Jul 1, 2025 at 10:04 PM BST, Mark Brown wrote:
> On Tue, Jul 01, 2025 at 08:35:42PM +0100, Alexey Klimov wrote:
>> On Thu Jun 26, 2025 at 12:56 PM BST, Mark Brown wrote:
>> > On Thu, Jun 26, 2025 at 12:50:31AM +0100, Alexey Klimov wrote:
>
>> >> +static int pm4125_micbias_control(struct snd_soc_component *componen=
t,
>> >> +				  int micb_num, int req, bool is_dapm)
>> >> +{
>> >> +	return 0;
>> >> +}
>
>> > Why have this empty function which is only called from within the
>> > driver?  At best it's making the callers look like they do something.
>
>> I tried to make a minimal working version that we're going to
>> update with more patches during next submission.
>
> Add the callers when you need them, right now this is just noise.
> Nobody can tell if the callers make sense since the function does
> nothing.

Ok, I cleaned it for the next version. Thanks.

>> >> +#if defined(CONFIG_OF)
>> >> +static const struct of_device_id pm4125_of_match[] =3D {
>> >> +	{ .compatible =3D "qcom,pm4125-codec" },
>> >> +	{ }
>> >> +};
>> >> +MODULE_DEVICE_TABLE(of, pm4125_of_match);
>> >> +#endif
>
>> > Why does this compatible exist?  If the driver is instantiated from a
>> > as a Linux software contruct it shouldn't appear in the DT.
>
>> Could you please elaborate a bit more? Should it be instantiated
>> as an MFD device or platform device?
>
> Yes, if it's the child of a MFD then it shouldn't need to be described
> separately in the DT.

Currently, it is going to be described as child/slave device:

spmi_bus {
	pmic@0 {
		pmic4125_codec: codec {
			...
		}
and will go probably in pm4125.dtsi which lists all child nodes with
compatibles. Not sure if it is because each PMIC is customazable or because
of better maintainability.
Also, might need specific description of regulators which may vary from
board to board. Not sure how is that supposed to be done without device
tree description at this point.

Thanks,
Alexey
