Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9552A36F907
	for <linux-sound@vger.kernel.org>; Mon,  1 Jun 2026 21:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780349851; cv=none; b=m3tW3QETkMltE3J2VdSqhkfr09OhuLyCS5o5V9zpHlUPfRcePmIdbdezJpBO7//VHZORMIwiSNAP+4Ud5mEME9Fkgs74e+Nm+BD3+6ih867zaMCrU6g63u35I9WgOL8CJ0v+psChz0HdkqFsyv425UlEu3zH4I01R7/l1/KibmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780349851; c=relaxed/simple;
	bh=n/DK08d7TEhH4Awl6zGSh5XmaThecj9JjYHMZpgRKNs=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=cQmnlCU8GUEZDBAwTyH6cMPgS1CHGAMPEAS3NWk9VAkrvXtNVaTi1x7IbJ3W5EkAaQBGuI85NhzEIj0f+m8KP+093F6WO9vEsoMUkBkdL18HVs8HqsGus9NJHnt8PxOKg42veN296rCSWX9U6H2GqrZffWVh6maKOLe4khvX8JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hxEME5tD; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hxEME5tD"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4908b92904fso53596915e9.0
        for <linux-sound@vger.kernel.org>; Mon, 01 Jun 2026 14:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780349849; x=1780954649; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n/DK08d7TEhH4Awl6zGSh5XmaThecj9JjYHMZpgRKNs=;
        b=hxEME5tDeZIPzIc2ynirDiLnaKT2+Wp6oFhl5XM4FDEN5eZRIVQAl4dw5ZCv4j0+Zs
         OwrWVScIVwAJHwDttLpKUwQZ9gkcWRfFLUxfl1JgKPY7ftrS5N7G58+vTFLcGIPJz6xD
         LY5otRYIjBNLC37TtTsUwlFX+r5r2mXeMyfaALAEqCtP5swLOsbVNLf2rZO8uViqKzSp
         H1Q+8aDCtrDrd6Epn7kZDbu5+j8tRW2VVln1Qnj+re7zMoHBOx3ZRtw+Xf9AFbGUE+aX
         YT8jg+b+S9yPvBTOfcp6rys/X4kgXHpdv6YHf0wVXXqAUxmcrcxgXUTMaJ1GcHp83g+I
         4T9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780349849; x=1780954649;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n/DK08d7TEhH4Awl6zGSh5XmaThecj9JjYHMZpgRKNs=;
        b=hI2Yg56MWUyF8AOzJb9RPbRZcrCyRP3L6Yb7D2/pkghtlUVpY1RmFijJoOPGCRpkcL
         lCAB0lu5hRQDKfMi/qve3MMdDu6bwPFYtevuy2GRwR/zVq/01UZcYa9Ejf4oqiv31qpI
         VsCNyzXM3NrKlRHQ8VlViG0txQgdUdpBzLLxRoZ3W+j5Vu1v6997dX7VVVHOiAN4Wmbo
         S/rdnx1LDpFeU3/1uUXdnn0ZtngOtQahIRWwUYWvsDnHDiWK2wZWYfJhw6XFis1ejEJt
         EpXCvVxfCOtBfvmMfg3RIVd8vuhWVvBgGZbPRVKjCZOOhDsmx8MUfzUQLt4j3MTnz68u
         JbRw==
X-Forwarded-Encrypted: i=1; AFNElJ8OP1ZDFvZrbIH7mPjGFKpehwjnziWLGw7okJQW5iypGIYHyKLC/0kIOnYrdYofshxT6ccQsTGbUo+xFw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwN0EVmPO2ZpOxIpLfW+34YK7bzXP9vJb2UCIuo6cK91ixrCPPz
	PtNpNmBsFnexq9j4SRkgbriS1kc3QG9ZxdgbmXBFwgolxPNKGXSkBM1ZXmge8Gx7baE=
X-Gm-Gg: Acq92OHfvs65ypAanq3isQ6phXPHwF9eZh8iX6oz+9WK4w1QOV27bUzuAwVKLbZ/QJz
	btwfSbN6Ick41tho+gQqvCmL7hh6KiQss1wBkmFyhDre/L18UQ2ZXUyc7Rbvh2QEbvFPoBw+hWx
	Fgub6t1xHLcwH0DJ+nRay5FL3URi5yZcu0qfKISNO8CVQg0hZDlMj9AFkmuJoNVzOasWBP8JETO
	8nstUPlspyynQMu1MbcsltpIy8bkTPcetPSDnnWgwkZLq1CPH34wMszAmooKIC+sv3ZWGbkZRWs
	K2qtPRtfOrokZpjvxEpCTj6U+pm+oGD1mcGkGsmX1GnVeCRSXk806lvlOvflMd0/+MZHweYJlk3
	YAOueVzl5zIB8l0vXiPGmnC2Abj5Z+Wuf3QvxSZqxeDk4aGcmH4BW3/JavvBbBOVgyWh86KwAk8
	jOhe6A+R58wr/UFhmz5PROfQYlURuqPD36ulRG5yzIjiToOgLeno1hRqMwZPovmLkVRyb46wAdK
	cgffA376ziI8EwetXumLgq1
X-Received: by 2002:a05:600c:a111:b0:490:7dfd:f7c2 with SMTP id 5b1f17b1804b1-490a29172bcmr173721375e9.11.1780349849034;
        Mon, 01 Jun 2026 14:37:29 -0700 (PDT)
Received: from localhost ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909c152570sm118760515e9.9.2026.06.01.14.37.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 14:37:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 01 Jun 2026 22:37:27 +0100
Message-Id: <DIY1CKXWI6ST.2Y3F25YGNFM1X@linaro.org>
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>,
 <broonie@kernel.org>
Cc: <lgirdwood@gmail.com>, <perex@perex.cz>, <tiwai@suse.com>,
 <krzysztof.kozlowski@oss.qualcomm.com>, <alexey.klimov@linaro.org>,
 <mohammad.rafi.shaik@oss.qualcomm.com>, <ravi.hothi@oss.qualcomm.com>,
 <mathieu.poirier@linaro.org>, <andersson@kernel.org>, <kees@kernel.org>,
 <verhaegen@google.com>, <linux-sound@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/6] ASoC: qcom: q6apm: return error code to
 consumers on failures
From: "Alexey Klimov" <alexey.klimov@linaro.org>
X-Mailer: aerc 0.21.0
References: <20260528185806.6316-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260528185806.6316-3-srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260528185806.6316-3-srinivas.kandagatla@oss.qualcomm.com>

On Thu May 28, 2026 at 7:58 PM BST, Srinivas Kandagatla wrote:
> Return errors from audioreach_set_media_format() to ensure callers are
> notified when media format setup fails.
>
> This could hide failures while programming media format parameters for
> individual modules and allow graph setup to continue with incomplete
> configuration.
>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

Reviewed-by: Alexey Klimov <alexey.klimov@linaro.org>

BR,
Alexey

