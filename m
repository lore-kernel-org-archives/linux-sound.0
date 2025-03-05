Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA451F3FC2
	for <linux-sound@vger.kernel.org>; Wed,  5 Mar 2025 07:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741160667; cv=none; b=tPPYEYsT+ifbe4J9TaTz9A8SHdI18H68ecYZvBQVgN/Agd2gleVsO7tnv8RmGqAPd5YqQrWMcXoERxnRxOGICrW9ctaLtWG96DSbYnee0+nXiqIeuv6k2AW8jqn90tlYGZOquj/RFWA2sjqeLqIKiYr+7pTtcKuGakRZgJu8+CU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741160667; c=relaxed/simple;
	bh=ifb7s8N7ASNPOB9E6is5k4+Ad3fbrf35zj+T/SPZtk4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ONBrPP+lLVG22v9xHuy4dM65BF91DfhwdL0G931WqMZVukhkR8U0AHIGbkpkDiimxxB3M7ZCoNEtUMUkNaikE27J2kPztyas4y0ciP3A/9Ex8EXjmzye/bSU+BDzzZjZv29q72rAtFavTSXtLF9LisXJL6gM3YwkACFwtD5DgN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Qm/YEr6p; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qm/YEr6p"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-543e4bbcd86so7162501e87.1
        for <linux-sound@vger.kernel.org>; Tue, 04 Mar 2025 23:44:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741160664; x=1741765464; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ifb7s8N7ASNPOB9E6is5k4+Ad3fbrf35zj+T/SPZtk4=;
        b=Qm/YEr6pMmGvma0NYVZVWOzQVDBkY8ifEK0jHyUlPji7CCEMe8UZgU1QKC3Nk/gOl/
         Z5Efplxg9rS7zdUTuWeEpiWODOXCYJ8XB9hz0XoHx7UJuuJ3vt4Uf89RJIsACVbCDesK
         njeMB8JtUGC16bBXvi35/Gc5cQRGEq3OaZpp0qdSh8tw5a8sg4dEM5D3EAdz4YPlLbLK
         vLSjv5VpBFyIgZfLQT2AQNpeZWy6f8f1Nps94nlpUqclvx1lWtqAt+Wlnfngx140dcNK
         XvFmPcJKzrMftLflgHldUmoIo/VEi7l2XNqqjbCR01DTNZ28NfViOD0e8oKM3jX/YSx9
         0U3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741160664; x=1741765464;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ifb7s8N7ASNPOB9E6is5k4+Ad3fbrf35zj+T/SPZtk4=;
        b=MW9lzbugXpM6yszA87dcW+YuXVygJ6jf7jXMERptENZnvpmeUjSyHL4XGQRcqnwkjA
         OsG6cJLm0Vbguwp0am3kcumkRJ/JQH7wxKr6wH7HhbH8kTD/IJGW46MIT9PnIYeGqPOw
         MQlsPyW0F56hSq0Q64N137okqe2FL6DNV9tYN0kGcUTAnIxhJMlXUXUPQPN9/j1CEEUt
         jv+vLE1TDgoQQrH2Xifk0E1ifFOsLSEjcexQRxLVhgKkabbKpdXjtutAfSBPSjzvYrUT
         NpxVZYABydhOYKV7IUQfgouo90EpQmorNgqyCFFauAUVzNPKMvgYQdFo3c+v2cpB3xdJ
         QQjg==
X-Gm-Message-State: AOJu0Yyvcrf5HKSe/Lp+40KNc4IqjvUpSMPSyjkZ0sG2cQBE0PRZht/N
	Al/6FnuRFlHA1VOs24SN/pd/b6pCpIrqErBWoW9Zl6mq8wAefAx6l2KJnhAJisLQMRhhffTGkX9
	O2GeQ9a2WZW3EHOoywoTZUnuY1UArNuj3iPZSkg==
X-Gm-Gg: ASbGncs/KihGAHCFBD15d5R+PcOqZCTIcxYkt5tRhu10YaOtP/iq283rUPp9MP19b3J
	JCFyBtjHd6Jzhx+8Q4jj5LGKkuQ3HFUpxnc/OPzrra4kbPzrpANYltxIayZ9B3AhraO89gada3Z
	gCeCfDBNhSHF92RI7AmynX4gtSWg==
X-Google-Smtp-Source: AGHT+IH72H1//brTKp7UPeHSY9eMogpG7qFDF82B9TGbZP/N55c5XfFJ3ZljeOaJZN/Ekrf02VMjpTK3YP2YKnwg58U=
X-Received: by 2002:a05:6512:2308:b0:545:bf4:4bd4 with SMTP id
 2adb3069b0e04-5497d332250mr683605e87.7.1741160663833; Tue, 04 Mar 2025
 23:44:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250305-samsung-codecs-v2-0-20bc980c6445@linaro.org>
In-Reply-To: <20250305-samsung-codecs-v2-0-20bc980c6445@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 5 Mar 2025 08:44:12 +0100
X-Gm-Features: AQ5f1Jr31kdFtNesf13pMh4snaXBkelieuVeF0YyE3rSN-OSc3IL0WrT8xClu-o
Message-ID: <CACRpkda_QjBpfyA1ig2cC+pn8Xf0Rk8Ox+pecQkbcbYY+8N7Cw@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] ASoC: samsung: GPIO descriptor conversion
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 5, 2025 at 8:39=E2=80=AFAM Linus Walleij <linus.walleij@linaro.=
org> wrote:

> This drops unused includes and converts one Samsung
> codec to use GPIO descriptors.

Oh I see it was already applied (I don't read my mail fast enough
in the mornings), no worries I can send an incremental
fix instead.

Yours,
Linus Walleij
