Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9634C215F72
	for <linux-sound@vger.kernel.org>; Fri, 25 Apr 2025 18:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745605196; cv=none; b=Als9/HtcD39MZnNCD9X0riuzcC7Uua7pl8G5Yr5odaGxL5qsGVewM122XNZmUVxG3EViYLNws1ctb4ZXZHQGMT+gCptmv5knZtN5+kyJtmFMRfR7sCJfxnUB9nC2Dpn/aCZvO2oS0i655NOTHYYVhi1PVw7aoTcKum5HdSaGRRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745605196; c=relaxed/simple;
	bh=IpSFoh4pYOY/HGqg1pleHeuH9QFifSvgR7QoQN+jals=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=Mhk3SwsDWAUz00sOn9XuyouhDxBIU3n2fBZOT0kQtf7bwhE/Y2G413glIw3PRC3Z0ne31CX3rLlyYtshUNE5UJllLhLLE9ladMN6Ix3RMfqDoIOWRamC8sHcxRQhqUjCuS9K0j/SDkcXhop+ZK0T/PghO0MXsEcLpMkdzvM4Ja8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=L2zE90Bl; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="L2zE90Bl"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43edb40f357so18096965e9.0
        for <linux-sound@vger.kernel.org>; Fri, 25 Apr 2025 11:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1745605193; x=1746209993; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IpSFoh4pYOY/HGqg1pleHeuH9QFifSvgR7QoQN+jals=;
        b=L2zE90BlQkCwN8RxPhglh5+YQzR3YQ8NPSekKiGRb4u2Zs2dfJ/tItuWZaFHeDES1f
         V5W+e3hYuUJdWUFXpzD7ozesoIyZ9euiDfsvy5aF6BGN67VAUFi9u1T/Xqlmtt+Fm/Bt
         nHZXHjAjQo2Cs5df9yeqE4vu60ATz6pMTKTRV5vW0GNzbI7KPI0GHiCRj9gzGiIGCZCK
         lPssUdlz3UXbcZ8ByT0YXjeDgGXVjsGq7iA5LoWzdHacW4tRqD74ODrKglFJLEoJ+wMB
         FAut6WbA3gE5MJI45Oz4oTFNG/tBUup5rFhdDT9xhpxiWbqB1dmIF9CtoynWk1jJkd9X
         Kpcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745605193; x=1746209993;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IpSFoh4pYOY/HGqg1pleHeuH9QFifSvgR7QoQN+jals=;
        b=FGLx1grVShpPSahsb5kTU0wr+8CB/AwE0YgBKgQ7Q+N+xlGVM6WfbQ4/BxnWyKJMzw
         /FeT1+bCqDtJUEikZgDDxkmyyn/7Lcmq08yDJFVnwsLoINn+/6gXD7jJ9OZSFeZOAO+E
         ebhjyUkf0Xm05tWLE9MS+8QY94XWHyJWw/k7BE/N1Tqn4XRV18ZCU2FpPvUIQDo/CSeX
         YbEHSbI6kBMWRPdbWXKaOxib+BFDQ0RQj54kzNtC00VYMHybA4PfFCdi41a34CIJDrkR
         c2hAfpSVWSjXy2Jk0c/xvA/ROnieahE3atFchqjNHZlcjWOvEMagSj9Q0ZNU23z5NaG2
         Zc6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXQXd3VuxD2zF8Y65S+KiUNEX3INkXu0A7/VKIjvhg3rKIsKmWU6jTv2IjbhsiylszJfAYYBrXu3nXD2w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOgXG8tl7lw8iuUj16or92I26HocLsrvYTjzi4soRQPzJAV1Xw
	4AUXHyLo/mMkazd5s0cqp3Rl66yuhg7r2TBCQ37ApzIg37vRqQkibhYTrAljgpc=
X-Gm-Gg: ASbGncvjZamBcJhtDa2glhtV//iMurWgq2a14fG15b3HBxq+LgBHWC+Tt1dgLc/a77d
	nTT9zcvZYjLhLh1sT0MOUsFQLeY9kX1aMGs37ER7p4hqN5HpMeVRDbqTV4o+sybmGEVR3fbdVCa
	1CzW1SI4cWzD63IrDHT+0wF8XLMqU+dgCCkLU4JI4JsbuUP4O8kQlRIoyZpNPSoYgnRMQZttBkP
	+qRZ+h4GtljK5ceJWQG/0Wa5nMJ3kPZrRYYEzEEFob1cb9uKZjX957Fp3MyXTzijkcHGA4hZRS7
	QY9T1E/y04Dighf2Vil21uvNVexUWLSd4FFquJ8Aiww2G6GGmmymj0+AergEsmZiBAohL6nlI0u
	/Osusa8sg7as8Bm7mCma1E/emaptVLDQgh3PxP6YVSsxx8nrpdKeV
X-Google-Smtp-Source: AGHT+IFJByfdmWek2xSwsLT86f5MrKiJHwIbsxI4YxA+BfoGu8K395c02Fr79u8UPzgvjnNg9CP1eQ==
X-Received: by 2002:a05:600c:1e03:b0:43d:24d:bbe2 with SMTP id 5b1f17b1804b1-440a66b7b14mr25609255e9.28.1745605192764;
        Fri, 25 Apr 2025 11:19:52 -0700 (PDT)
Received: from localhost (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a536a02csm32734525e9.27.2025.04.25.11.19.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 11:19:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 25 Apr 2025 20:19:39 +0200
Message-Id: <D9FXE4TJ23QB.1CS3D6PU2FGMR@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Mark Brown" <broonie@kernel.org>
Cc: "Srinivas Kandagatla" <srini@kernel.org>, "Banajit Goswami"
 <bgoswami@quicinc.com>, "Liam Girdwood" <lgirdwood@gmail.com>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Jaroslav Kysela" <perex@perex.cz>,
 "Takashi Iwai" <tiwai@suse.com>, "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>,
 <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <alsa-devel@alsa-project.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 2/5] ASoC: qcom: sm8250: set card driver name from
 match data
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250425-fp5-dp-sound-v3-0-7cb45180091b@fairphone.com>
 <20250425-fp5-dp-sound-v3-2-7cb45180091b@fairphone.com>
 <36904d64-68e1-43b2-baed-50b5fddc2bcb@sirena.org.uk>
In-Reply-To: <36904d64-68e1-43b2-baed-50b5fddc2bcb@sirena.org.uk>

Hi Mark,

On Fri Apr 25, 2025 at 2:12 PM CEST, Mark Brown wrote:
> On Fri, Apr 25, 2025 at 10:07:26AM +0200, Luca Weiss wrote:
>> Sound machine drivers for Qualcomm SoCs can be reused across multiple
>> SoCs. But user space ALSA UCM files depend on the card driver name which
>> should be set per board/SoC.
>
> This doesn't apply against current code, please check and resend.

I've based this series on next-20250417 tag, so this is probably due to
the changes from the USB sound offloading series that Greg has picked
up.

So either Greg also picks up these changes when they're ready, or we
wait until 6.17?

Regards
Luca
