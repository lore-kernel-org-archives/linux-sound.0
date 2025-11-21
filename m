Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 710F92F6905
	for <linux-sound@vger.kernel.org>; Fri, 21 Nov 2025 08:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763714222; cv=none; b=ePBknQ/o5MD7k58M5hel1ir9+nLSoCDM8i97duLOtR4iSllTjeaHV2CmBq8HV948MMb7Fm2vQUueXfbTxaWF901BeAm07B+3+lr0y/wWs88kAvxlVj++QReqfMzWJVUy+oFeT7PjkF0s1yrtqh1wyKWy10p7Gwr+o5jIE+7hiI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763714222; c=relaxed/simple;
	bh=2CSuKOB0Q7+xqXD4ky+SFzZuaVcYW2fEBobu8hliL4E=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r7nQUQFLQai8/gocyHfxgVkbGZD4cgZq/RgVQLW+xjwpf+NRh188KqsEKVlF+e41ZP5057xjbfV+yFImzzfhFS1LdIH36T8QNix9/pOgzD9sP+vJjTUXDc92OFVOUk9yvMZ2sPsVqc9e5OUu2zxqbOeJ/JY7tPyrseVMoomJ84s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S1nx8Psn; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S1nx8Psn"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4779adb38d3so13016745e9.2
        for <linux-sound@vger.kernel.org>; Fri, 21 Nov 2025 00:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763714218; x=1764319018; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1wEtuoMiVjHpLpaR9GzcLxm957ZTjBHVy8JV0VCpcAs=;
        b=S1nx8Psnst2QvO22jZHkF/WvdHUePcmBmX3QarV8FQ3I+l0o6HhjQjZcwCAEyZHQKb
         9wdArUp41p5BngCSLIRbQmSjPzkhbBzCwWdPgj6Wm30F+V+gblb0Mo9wT+8VYNrtE++s
         +QLr/PMkFYRjVULMaVPyYXmG2n3Xbt2ZsogJ6KLT9WTkdBeI0h/XGf2Pe3TIh9KNnaZp
         Uh9DCjT3afRo+kNU4M5IE2SqvISYbQrKLSoojNdVRcDx3tYt9FLS1F+sWDA9DD3F4HJu
         ON9ijQEa5l9+AUjRgat70Oivn8zQcmAQthiX+IxMAHklRFdNFVzd9H55j1fMseTOZff5
         C0RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763714218; x=1764319018;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1wEtuoMiVjHpLpaR9GzcLxm957ZTjBHVy8JV0VCpcAs=;
        b=XR7YfLF3ve5aeYVQ1MyxpUCC33UEpmWwyFD5loA6ny+Ydd5Vw05Vt8kZnvS0gj3+ls
         5x01oX1XIYt75fCBoPqEBqXwaIPM1mPM3/Cb1f/qR8YuujXdDEwlEunugjgAlgj6RAN6
         ZTlhbLtXhcrVKjwx7O2hIX0CL02NL/OPwTO6QPQQjYq5DwlSNisTwUkxILsKuPnDoAID
         N9RDmwA4oao63SEkbM389LIyk1oAMkdw4tkFFlsevcGSvLU2GiNMfOt7Ch/5g2aCuMx3
         elRS+VmiNMnj3WXgUaE5FSqCbzPnnnGvxp+JAFKMqd67HoV7kDhPg4xVOOL+Ft//x2Y5
         OcOA==
X-Forwarded-Encrypted: i=1; AJvYcCXLqIplqQlikK1ybse04fEJ6uyDm8zJZgkB8XNqQs+DLU/5EEyXiftN9vub2YLBDfmAPsJuFM+ko0VSQA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yynnn5UDdL1flW8emqbD4VnPeba2EK5e2XFG1SN6T5Kfg9LEgWf
	SbsumPC5ounMz5Fob04z4hMssXj9/tqx9u3mxtbRQ1P5nvGbom6E6J9n
X-Gm-Gg: ASbGncs1Z1D3IrAcZsHioEgDiW1s6pSRuexf2hMZhtjrQXXFbglmJn9XNh/+7koaN/L
	pdHc7C7zEHItp4dNqEEEMbxbRVhwGBJWgzaO2IX3kVZaisXztuVMoL+Cha2BVG4NVKa+5jpE9CG
	QqJVPkLntjmseiqX5K0K2oWn++x6YmAq8PlHgjVs+SholJJN5XE99lLudyVSIT92ZGcelxVhSpr
	h0Bk///C5y+kApJOFPbzy6QLmjkN/iI/0x0Ja1KicF9fVKRFtmlHe9nrZ8pRP5LDtETRRjJhbCX
	0wQsEUMMLGM4d9Xx771EuWxFbLsZQCwqenPD1J1OhxdL+aey1EC+JVtuPfH9SqIB/mCPYAwmSCn
	mdDDJiVlz91BARKfkuAhSlAwcbl+wBE9ygG8FLjnACL3d4MNn105XJ8+lblKp/OIVaJrdPLmu8s
	e0ROYJFDsbmlGI9NC8edpwe7l81bZWSZDCyUHlWnE=
X-Google-Smtp-Source: AGHT+IHPLw2jQaPF5ElF0qIXmxXxh5kNC5rhs4V0teeBNwT7wDD/o8bBEszH0XJ2zTJXCk24Llcm4g==
X-Received: by 2002:a05:600c:1c89:b0:477:8a29:582c with SMTP id 5b1f17b1804b1-477c01fc60amr15542125e9.34.1763714217408;
        Fri, 21 Nov 2025 00:36:57 -0800 (PST)
Received: from Ansuel-XPS. (93-34-90-37.ip49.fastwebnet.it. [93.34.90.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a9dfd643sm78628425e9.14.2025.11.21.00.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 00:36:57 -0800 (PST)
Message-ID: <692024a9.7b0a0220.878f3.25a3@mx.google.com>
X-Google-Original-Message-ID: <aSAkpwReMrolkA5k@Ansuel-XPS.>
Date: Fri, 21 Nov 2025 09:36:55 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>, Arnd Bergmann <arnd@arndb.de>,
	=?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, upstream@airoha.com
Subject: Re: [PATCH v2 1/3] ASoC: dt-bindings: Add Airoha AN7581 with WM8960
 YAML
References: <20251121054537.25796-1-ansuelsmth@gmail.com>
 <20251121054537.25796-2-ansuelsmth@gmail.com>
 <20251121-hospitable-tacky-cuckoo-b53af2@kuoka>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251121-hospitable-tacky-cuckoo-b53af2@kuoka>

On Fri, Nov 21, 2025 at 09:33:45AM +0100, Krzysztof Kozlowski wrote:
> On Fri, Nov 21, 2025 at 06:44:59AM +0100, Christian Marangi wrote:
> > Add documentation for Airoha AN7581 with WM8960 i2c codec YAML schema.
> 
> I don't see WM8690 nowhere in the binding, so that's a bit confusing. It
> feels like you mention here entire sound card description but binding is
> for specific component (AFE).
>
> Well, anyway, probably not worth to resend, so:
> 
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
> 

Maybe I have to send a new revision for the machine driver so I have to
resent anyway.

I took mt7986 schema as reference and the i2c codec card wasn't defined
in the example.

-- 
	Ansuel
