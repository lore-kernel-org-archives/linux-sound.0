Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C69267729
	for <linux-sound@vger.kernel.org>; Thu, 24 Jul 2025 15:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753371667; cv=none; b=qdde9oT9kh3tXYZFPu8ux3gKCyFNe+G+RO741OEe6C/KwQ7AaH0JXIYWFyKepmOTQ59H6DyPMVG7e6A42XRw37e7g17AevYFSlyDnLJnTqAvozbR9C7Hjd3UCYfGHTiKx3ZXR0Egj3z7rdS5NvSGJMnvrmw4k5mBlzVBlETDJOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753371667; c=relaxed/simple;
	bh=rL72xLvDpaYB5a3K56U+QX+tDm0UKRXbjJu7lpGADJA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=V2Q1ernvl4a7SQUUTRhxAfj0LcnWAEYKHQ+7gJRSK8udu0CVi59G1yf2OGnI7kcS+fSh9QK6UveqiTnVDRYJ90bWeRX3z5MeVQFgOx8anDPkIQNQu04/sUJO+WhqCEM3bZbEbAY7OuKZx52qDJeAJr0vWWVjIzTNh4atnGzvjVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H4fXOLa2; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H4fXOLa2"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45617887276so8024505e9.2
        for <linux-sound@vger.kernel.org>; Thu, 24 Jul 2025 08:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753371664; x=1753976464; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ijalKac4tH/bOL3hkdX4ec4lsO5RsEUy1SQ79bJniFw=;
        b=H4fXOLa2L7z4w2CWSCTh7c+w0wpqWUYXBVlunlre/7F9iX/aefEVA6PyBEht1wCa6T
         EYGYyjMXJRU+t2Kti3H9VLa7ebbewV1ZoOFNqlpAH7xpKxno+liAUvG/Tnsamk28LZVF
         FZry65eCK6e9utHQZ9bjdvEFfPyWafUN2nFZ+a1CTQYSnvlamy+dyOdoIIu+JWA5iSE5
         Swdxljkm1kCqC4cKvkL6aPjVGeKbXbTPcYubi6HYQxb+h5ZNefBLJ9oj2O7VdQu9nI9H
         koZwt7Xj/rw6yNjOrG6M17+66L8FWy2Y3ohgbk34sbt1URaBOVd92uCxZRD2thEO5Cdy
         Wigw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753371664; x=1753976464;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ijalKac4tH/bOL3hkdX4ec4lsO5RsEUy1SQ79bJniFw=;
        b=WAZt32hd2SRcURFEx4VIOrF/CbMlkETHDXNsbJvusXoIoqxTRJpDE5QMu8UzVwKYcs
         1yJZivRUsUtSOwlN7lGN8dzOewfC6cOdhWE9ebBp3AeAtuov8BD2iGfr1/qiY8vD47HH
         JR72DHgXGsR5Ypz5pF5ckukvDt0drW3lml1IYJyhliaEJOA5cqH27+S6uLucsuIFGjtH
         2fDMKO//w9fJysySB1xEI7KxWj7TSwp3Y1SmZURpEzUvedpwg4sCe2yGKchjnnvmHzn0
         bGrl8vnf6QhzBu7RWUg7hlVIFsJqvYw1K0VwKJzH0Tx0ZMRCAA7KSLfdiMmJptYfxQRO
         Gfvw==
X-Forwarded-Encrypted: i=1; AJvYcCX6qzcNUBp65R5iN83L+u/EdnKfqSRKHO8GK+JlD3JgDDyrGLrGHII7SZaGjP9YdUBSogsZFMqKbtkOOA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9/P2xp6KU8HKmzpT8sZMZ2jqNNExzTmzqlsN9KFx1APq5i/so
	5OOsumnBTnRSpW03p0FEHEngWCDkkhzo2iSgkhOTTTlTP/J2vV+nCZ758fPh0iLkugE=
X-Gm-Gg: ASbGncsWfO9X9PNpAZBmgwH7miFKsoIC0cMGCfaaDEsJZjhAKhL0D9Fay6vgMcxuLDk
	DeOHlnd9otB4qM2K9l3NUxuXtGTDxIbrZMEcnmiJ+Re+Ve85FgZRyC4M/U4WreWezqga5GEVaau
	cIoxsD+4VNgTyFym11KqQOTC5CezvV4+CPAFr0/3oxjoqByKmMjxDvk4vArRyRBAWaNukMVf0Ia
	W/NiFYKkDSpedw2MmcpHc5fFvroSSXsgD2trkTxI5N9+vx2Oa+KGkkxJ7BTJu/oozHUOkqErZHv
	3Gz5Tdqje1YKzL+3HbJBBZwyqOytqI26HhhLufZjHFYdeD0LyjJ30AxiD7sOr2HwVS6+7T3bdBL
	UJxVSPPRjjP4ZMHStze/p/qeYV1ZuzAeuCgzDaQ==
X-Google-Smtp-Source: AGHT+IH+Kt4CbvgwU5Pt6jGjtNicK9BRckQRniUA+bTcD0KYObJ3m+6Ey87TiLjq1ghjyaSgL9Tpdg==
X-Received: by 2002:a05:600c:8905:b0:456:19eb:2e09 with SMTP id 5b1f17b1804b1-4586954d51bmr52814455e9.8.1753371663558;
        Thu, 24 Jul 2025 08:41:03 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:6c39:59e6:b76d:825])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45870553d72sm24018765e9.16.2025.07.24.08.41.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jul 2025 08:41:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 24 Jul 2025 16:41:02 +0100
Message-Id: <DBKEDPOEQHOJ.2DA0F5PUZGCJO@linaro.org>
Cc: "Srinivas Kandagatla" <srini@kernel.org>, "Liam Girdwood"
 <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Stephen Boyd" <sboyd@kernel.org>, "Lee
 Jones" <lee@kernel.org>, "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai"
 <tiwai@suse.com>, <linux-arm-msm@vger.kernel.org>,
 <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>, "Srinivas Kandagatla"
 <srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/3] ASoC: codecs: add new pm4125 audio codec driver
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Krzysztof Kozlowski" <krzk@kernel.org>
X-Mailer: aerc 0.20.0
References: <20250711-pm4125_audio_codec_v1-v2-0-13e6f835677a@linaro.org>
 <20250711-pm4125_audio_codec_v1-v2-2-13e6f835677a@linaro.org>
 <20250711-hungry-uppish-taipan-a0a35a@krzk-bin>
In-Reply-To: <20250711-hungry-uppish-taipan-a0a35a@krzk-bin>

On Fri Jul 11, 2025 at 9:29 AM BST, Krzysztof Kozlowski wrote:
> On Fri, Jul 11, 2025 at 04:00:11AM +0100, Alexey Klimov wrote:
>> +static void pm4125_unbind(struct device *dev)
>> +{
>> +	struct pm4125_priv *pm4125 =3D dev_get_drvdata(dev);
>> +
>> +	snd_soc_unregister_component(dev);
>> +	device_link_remove(dev, pm4125->txdev);
>> +	device_link_remove(dev, pm4125->rxdev);
>> +	device_link_remove(pm4125->rxdev, pm4125->txdev);
>> +	component_unbind_all(dev, pm4125);
>> +}
>> +
>> +static const struct component_master_ops pm4125_comp_ops =3D {
>> +	.bind =3D pm4125_bind,
>> +	.unbind =3D pm4125_unbind,
>> +};
>> +
>> +static int pm4125_add_slave_components(struct pm4125_priv *pm4125, stru=
ct device *dev,
>> +				       struct component_match **matchptr)
>> +{
>> +	struct device_node *np =3D dev->of_node;
>> +
>> +	pm4125->rxnode =3D of_parse_phandle(np, "qcom,rx-device", 0);
>> +	if (!pm4125->rxnode)
>> +		return dev_err_probe(dev, -ENODEV, "Couldn't parse phandle to qcom,rx=
-device\n");
>> +	component_match_add_release(dev, matchptr, component_release_of, compo=
nent_compare_of,
>> +				    pm4125->rxnode);
>> +	of_node_put(pm4125->rxnode);
>
> If you drop it here, then you do not need to keep it in pm4125 in the
> first place. But this will point you to the problem - what if
> pm4125_bind() is called after you dropped the reference?

So I guess the right place is in pm4125_remove() right after
component_master_del()?

>> +
>> +	pm4125->txnode =3D of_parse_phandle(np, "qcom,tx-device", 0);
>> +	if (!pm4125->txnode)
>> +		return dev_err_probe(dev, -ENODEV, "Couldn't parse phandle to qcom,tx=
-device\n");
>> +	component_match_add_release(dev, matchptr, component_release_of, compo=
nent_compare_of,
>> +				    pm4125->txnode);
>> +	of_node_put(pm4125->txnode);
>
> Same problem here.

Thank you,
Alexey

