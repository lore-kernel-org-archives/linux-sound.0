Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3131A78F4A
	for <linux-sound@vger.kernel.org>; Wed, 10 Dec 2025 14:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765375613; cv=none; b=JKIUy4gZCIeGFmAeUXA/cKlfCOsyzsaY4dSxMzDqlcE1yGTaVZIakiBwbfSxss6Yiw+oKsDLZz7urqKDHOX10viUG6DDrImOk1Mx/1HFgwGwXmr+9HX48f/fc9QxtPN8hU7zsVAOa3uPDZw8lZbBjsK+LYASbbOiwmwMN0Pxns8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765375613; c=relaxed/simple;
	bh=9e/kA6oIOyhPzKZ7ArQO0A4zv907CzD/WHILb6v+0H4=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=kqgz8KToVHoFAkzXF5Jbi86n/foo+ol4AheeK1JhNL2y/5he7OQy2e5S4MwmUo0JDAifZcdU2x/H2oetTRLZgIrdn3nKQ5i0g+KbFLWFwYnGBsEVd1jjysXaLG/e6skNdgJYR12a1iH3vi3btvyIJJBnTLMa8Xx2fFiXiVYFQog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d11e3VS+; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d11e3VS+"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-477a2ab455fso78546745e9.3
        for <linux-sound@vger.kernel.org>; Wed, 10 Dec 2025 06:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765375610; x=1765980410; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9e/kA6oIOyhPzKZ7ArQO0A4zv907CzD/WHILb6v+0H4=;
        b=d11e3VS+FuWCQmjJv/8VQ8uuTBLoF5smnVZA//5pGzIjMGoj/uzPgMncQWXgYdB9fA
         oOkeKNttBAO6qqgP+JzypXmYk16GJeiYNPCBramlfrI7YMnAzK+Thr7D1DsjKndJ90bJ
         oH+v7zC68EIwhVEM/Xc65r9ZdeLH3Quc4q1bl4hSjy9sTPtauL0gC0bF2BoUx44pMIwa
         0vms6K//kwSY8Ln9eRn82u6MWhhP51Sx3COSx5Ht/AL3ARsdsJGqjoHRcrHLvHXuSi/k
         08wNF2gf+azIacw+tWzB4wMTxgl9jSTRwX+1y6s+7Z/ZlQ3JujtvovkWrleF8h3depy0
         lnmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765375610; x=1765980410;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9e/kA6oIOyhPzKZ7ArQO0A4zv907CzD/WHILb6v+0H4=;
        b=vKjjbJspPTgRLO2oxs9EqF4TjLwjPHIWgreA/gprbCRZVrF1i3EBbwfDl+vWr9Bd1Y
         nijV/UoVoJqbAkttIUf7/Bm4n+qz9EOPccbH8qkDpGOH/SmaVzEGUS8nr+ix5tLbxy9q
         Ae+4EGwGIwdmWRS0G+YqVfP+98hma038o2mT9ONIPg5lAJ64peVLvY5b9sNgztqKgOrN
         a4dLjvNxk96dpHTBqo+NQv8o7yvrm/OLJ+bqaEnDfd+gvCczoLeo2QkxUkP8yeK6rjju
         7i6CcSYg0dukkriD/nnTSk+g+BXylc1StpQvySHX+Z6+8bQzYYyYHSKynFRM/Spx6ni2
         N7MQ==
X-Gm-Message-State: AOJu0YxDQ7fDHBRyhxyHBa5D20hFX6u6aN5lpaucA3SMwJUvx2C6iEh/
	HALAky8IzaEvKXNm+YiIqR2QG5xtYw5J8yuxZbjWASxTTr1N5/JpJcwcss7AEyWhdZ0=
X-Gm-Gg: ASbGnctpLi0B57NQRR0uvYdVviKt9kNv2O4RI4x4eeTiJ5ZDIakTQUPVPgKququHy0w
	+th0B9+/uZ/skXyBz6WRyML8wKKySfCwpp9CUBgsUy/bBm9NDx6wWffbpckLv54hocaG3TFD25J
	ST6DjwPN5KZ5RKIMRHG7P0hupKM1O32A6JaSyuZztkWuXenZHLu5P2eXWjcx6s201di/n1llY5Q
	S+VRSa0ofz+ErzzM90GzxvuFV/Isiajx3Y0HtjgQOQOQ36Ujw6TM/FSVv0wtM/gTOVt92+kYTad
	Q97FqcGkFy2RHVJCKm4qdrlmFrDZOah2r7BDeU/e0AXvIVJld7eGZqotTjC8NdMgXwbFWkEVySG
	FfWXlEv4AnkIo2J8OaTdgJ2g+Owxptt1AjHhcbNaoTNeLVlMLWk4U8fLwrrpJRmvn4wy2ylh3ja
	9Dxo0zeWo0AeKJhCFI
X-Google-Smtp-Source: AGHT+IGxMmlCENm65g/khz8an0IvkSqbfpyWL3jSQKULfpF/64kGTl6NlqmP7uQSZpTUXP2PqVLfcg==
X-Received: by 2002:a05:600c:a086:b0:477:5ad9:6df1 with SMTP id 5b1f17b1804b1-47a8374dd5bmr25998775e9.3.1765375610609;
        Wed, 10 Dec 2025 06:06:50 -0800 (PST)
Received: from localhost ([2a02:c7c:5e34:8000:6c67:affc:583e:e754])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a82d20247sm44814375e9.5.2025.12.10.06.06.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Dec 2025 06:06:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 10 Dec 2025 14:06:49 +0000
Message-Id: <DEULFB0XJ883.3CHFIXANX1FTH@linaro.org>
To: <david@ixit.cz>, "Srinivas Kandagatla" <srini@kernel.org>, "Liam
 Girdwood" <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>,
 "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>
Cc: <linux-sound@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <phone-devel@vger.kernel.org>, "Robert
 Oscilowski" <drgitx@gmail.com>, "Casey Connolly"
 <casey.connolly@linaro.org>
Subject: Re: [PATCH v3] ASoC: qcom: sdm845: set quaternary MI2S codec DAI to
 I2S format
From: "Alexey Klimov" <alexey.klimov@linaro.org>
X-Mailer: aerc 0.20.0
References: <20251115-sdm845-quaternary-v3-1-c16bf19128ac@ixit.cz>
In-Reply-To: <20251115-sdm845-quaternary-v3-1-c16bf19128ac@ixit.cz>

On Sat Nov 15, 2025 at 6:43 PM GMT, David Heidelberg via B4 Relay wrote:
> From: Robert Oscilowski <drgitx@gmail.com>
>
> We configure the codec DAI format for primary and secondary but not the
> quaternery MI2S path. Add the missing configuration to enable speaker
> codecs on the quaternary MI2S like the MAX9827 found on the OnePlus 6.
>
> Signed-off-by: Robert Oscilowski <drgitx@gmail.com>
> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
> Signed-off-by: David Heidelberg <david@ixit.cz>

Reviewed-by: Alexey Klimov <alexey.klimov@linaro.org>

Best regards,
Alexey

