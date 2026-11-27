Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795769112;
	b=y9BUzmMeVQDGwqq9ZLgDpFuzx9hBLRhm+ruVYrBPB9jpaVnC0IY/eHM4lgqYxXR9htCu
	 oR1JY6Q23+wfTu8eqZqgr02B7lRxhsK9G5vvRsks1hZb65khnOI8vQ4K8dEHZ0pYnG6a5
	 SJz0zO+77QcSCzKE8+Kvi/x36qvLH3cJ0L/w+H6BwR8lMHpvy9EwrXFQhASF6c3rDmeLe
	 SCwufV2XbabaQzNCfCs4UHGZ5Gd9zWwy3/Jc6hrRzrK/aLRKWFDU+jJV0m0lJFJ3xG3S8
	 uUrlq/rnNUl8tl9sEqL0QaL02qWIzKd2uD27tUYSWo66hr+kv4+VuHibTtBap4jsRDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795769112;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type;
	bh=/Dn2D8XkSGEfDxJntGFmwA2DusnT2l4fyR3s26i/q2k=;
	b=a83N22R11apG3yWo8/JAUG64m58Qt0xmgmfkAvgh4deD4wR5k8MAyp9wjlxssZ6Mzbhd
	 GR+RwG4F1MP9cWUlKbJY8wozWJLtNBbYsAkXMpyKHjb1Q0VfPH8maEkK+czw0YelllPmv
	 isVoBfrWtMlha5KY52P0u+PhI0siYO/hOKmuenlPkb+nBYvvhA0Hof5PQkeLXPBdJ6ov/
	 bZeRSQjDKq5V+vCaFil0U7cqOXHAGfXNkrK6iiS/zcqq/bhhzFUWX6ToCt6a0XIfTyE8G
	 +r/GOGknvHMmHFyzCXcRwpdG+aAfCdLQhcvXkbOibzl8JSJot3+8fFnXnxNQGXCwsqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=MRD64OoM;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B0A606A326
	for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 08:45:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76B0A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=MRD64OoM
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c5133831027so1090515666b.2
        for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 00:45:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795769109; x=1796373909; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/Dn2D8XkSGEfDxJntGFmwA2DusnT2l4fyR3s26i/q2k=;
        b=MRD64OoMvCFGHZzsUp9+PwRr600pYUT0w3py/Lhu8RIPbqz6DXgVcMB/2Yq02pK7Jk
         zIr7Bip3xailSfRQcn5XGVNVqY9qud32SG3Dh/HIncZv/GYYDGBs/yjGvu6uagZJ3jPH
         EFINEQR8KwtgdsJpdpN/TGnxBzOw/N8Fm7ivr3hJXlrbYE4F3S+5wVPl5IpGYJ4GFeCY
         MaYws/JsouoDxUGRRwa85698slMGV7CjYPGuL/hUtgKI3+gg/PgfrUtBbLfNah4xjtVW
         munMq2IlGI+FdDn19++xCQ259D97pO+8nQPNtINOJhw74xx1qVicWNXaQidZ9Ok+FWl7
         keIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795769109; x=1796373909;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/Dn2D8XkSGEfDxJntGFmwA2DusnT2l4fyR3s26i/q2k=;
        b=WiWiPThl0ZQOx1nGNOEDvVOJHJ2pPsuzPzCFemygh3sfmPCJlk5etKH5WTD/MrKnbW
         ALhLLNvIDIRQkS4p5dzV0UMdppkPw+fUD/BAlUcqaYXBaDSzU3EIpTTyPYOXBzR5iM5m
         L/A+F4RdsckJxEH1jRTt8ocMXHduIezz+QFk6evVya/bVYy1y+kcRQ6aJdqko6ASh6st
         8wUeTTyTehb6t2pX3cOHUPGMsJCmVEC3SiiME/iBGLaRkn9nTTgiDYcdttSVo1hKeg5l
         S5Wl/zA7QXf3ldUu7P4cAI1IUwmQQZFpLLZ26Q1ElK8KyQCJ/pLgu+0l+UoUoGtgRnoY
         2g7Q==
X-Forwarded-Encrypted: i=1; AL+hErFHaCFQgzL5N8x5n4OAFkk3FhnewHctrRVZcvbpw/sjMi/8n6MuLI3CU+awd9O6oANY7MO/HLX14wUCtg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/CW7j/zh86yAWckvNruUtLMsvkw/zggF4WscvGpWKFQC6PrTLc
	fjamCO1UbF6OscAwVGWn8SQFqbnYw+GGR4ByMJyQPMbnt7TEKMWl1gouy0qRKPCXqRM=
X-Gm-Gg: AZFdTZcAFnMAy64tJIFbPpB55kvuae5qQOWR4r/UKu+ROVDI0MFDFzdQGmICiirOxnI
	i7Sdp9g+786i0BDfW6W3u2Nd2wOMbq2kqASbRAJcp/lxul/ZsjxkIGawy1ypPoEqOaI+5bjCCnY
	655vrmp7P/18/KosbnuG4NZn2sj+QzXBbILdPiEH6g8W27IcgYgTQbyatNDu/RgNuKKsLMpwv/8
	DC8i8kb+caEOs490YfNlZIComzYAQrrQSxI0KaEQETylQMpYA42BRxUT5GTpbeRCMN/h+McCCJj
	8zo0rr5+OUq1OTL4EIjhK5j/JvatazoAKabGQKMJqHoTvb2/xFyBRTf+3yQA4Ljy7pj9u3Q5xgd
	CyU1eHTjimeNy4+lZSMUGAPBR+oPXxeb4cZwu362G+po25C3tILFu6wdZ8bc/4cqlhrx4RnjkGI
	wFRpXSVQe/3aGdDHmw4YOpaUdHcJZOkgxIpFcY1CklCRHPkN2Ye7tnFwSZM5nd52CPU9qqVLL/b
	3GcenPkhJoCtQ3mavRYxZALUyfHyXWzez9oHHH7XSCtusgHOc/PooHvxXHIIgWxJPEz1sq5LufG
	xRN+fVNfiP1WYP6Mfc57qeBIt/uXfY+fuMxLfJ9tDGFGBoTj
X-Received: by 2002:a17:907:6c17:b0:c51:3cb6:5b11 with SMTP id a640c23a62f3a-c513cb65d73mr1971796666b.49.1795769109636;
        Fri, 27 Nov 2026 00:45:09 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aea31e4sm851467866b.39.2026.11.27.00.45.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 00:45:08 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jiebing Chen <jiebing.chen@amlogic.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 jian.xu@amlogic.com, shuai.li@amlogic.com, zhe.wang@amlogic.com
Subject: Re: [PATCH v8 5/5] arm64: dts: amlogic: Add Amlogic S4 Audio
In-Reply-To: <832c4090-d6d7-4c3b-85e7-ed7dfb8c85c4@amlogic.com>
References: <20261110-audio_drvier-v8-0-1489241e4c83@amlogic.com>
 <20261110-audio_drvier-v8-5-1489241e4c83@amlogic.com>
 <179536111581.2728475.9919460533427781841.b4-review@b4>
 <832c4090-d6d7-4c3b-85e7-ed7dfb8c85c4@amlogic.com>
Date: Fri, 27 Nov 2026 09:45:08 +0100
Message-ID: <1j5wxi3bor.fsf@starbuckisacylon.baylibre.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On lun. 23 nov. 2026 at 10:48, Jiebing Chen <jiebing.chen@amlogic.com> wrote:

>>> +
>>> +&spdifin {
>>> +     status = "okay";
>> ... as sashiko pointed out, you are indeed missing a pinctrl for it.
>>
>> With sashiko remarks handled
> AP222 does not have an SPDIF IN port. I will remove it and update the 
> interrupt number for SPDIF IN.

If you need an immutable branch for the clock changes, I need you to
submit them in a dedicated series. Let me know

>>
>> Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
>>
>> --
>> Jerome
>>

-- 
Jerome
