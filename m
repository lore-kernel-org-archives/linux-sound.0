Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF2714462A
	for <linux-sound@vger.kernel.org>; Fri,  2 Feb 2024 15:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706888501; cv=none; b=QFG02ifG6ztU9fe2gIg5Jm971vk3muaFD71Wz0pWKJ9A+AGqMiWY6KZEqwP7Ww0muMymnLTr2Cjov6+WQEI7/n+E6/EQ2TuQddNtfUX/IoqbUGiOsSMVVHXYoJPOnib8xoPFLXiApGEDfSDwi2jNh7ix++imgmewmv/H8KYLprI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706888501; c=relaxed/simple;
	bh=eJrK77JbCOPtMQySye6xFo6DxvsSg0ZFdJ/9vChdHvk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ikf236lEzsCem6ldoJnDrutZZ5nWa6FsGL+EtfzkoI9wOaNiHYDmFoQ+VATk6yoJw0LbpmMjfp2wu4/V9Ck1GPHKpc8ABVZf3nUHaXnkKOdU6tTiQvTm3TwrKLZOn1veiNyMhiN3ha9tA2V1srVZhF8/wOlUEjjRLm36h5DvcLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JRAQ/uqa; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JRAQ/uqa"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a36597a3104so309574566b.2
        for <linux-sound@vger.kernel.org>; Fri, 02 Feb 2024 07:41:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706888498; x=1707493298; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U9GFyYMnxvYJ3CC02VMRtntZh2qFQxlE6u4r2ee4s6k=;
        b=JRAQ/uqaOyz6yCxNY/yONnT2shr9LiBxALSyyjhv8pr3RwSv/COC5jrmXC3kmRWVMH
         w34hIeIfIPKtvCoC4lG1N9YzJG0T+3dh7GhhvyuUw0jN53oXMC/Rgk8DxQc3bMXIjfhf
         tD2e8N3njtADuFACOwLarHNtG8cp1W4SYMe3gUAPDwxHEgI0Vp9NFqD12UkQZJntbH6t
         A3Xcq+K1GGB9M04keO2PJglxlVcM1EEG5fk6fZqMuOt2MBerebJb9QM6n/gTgzGOLb84
         7G0lekGzhJ1tOrErIlTDz/j/LNlx+LC5ecWscnFwt5tH2PLuSPqAb7t5h59V0ZnRvpAi
         pWNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706888498; x=1707493298;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U9GFyYMnxvYJ3CC02VMRtntZh2qFQxlE6u4r2ee4s6k=;
        b=TObQ2eNVjqtMReWrP9bQneCpAoLQLKmk5A4og10YgvKeNTklwakLqtg1uDCmfF0ZnQ
         5m+OchvJqhHn8gntkV+XNzFZJKLu746tj2RrLt3/uHGlpSR83WYhWT6inAeQguo4xRXi
         wKIDqLfuP0K9cr4bWEDY7efz03+B+Yx2/pNCxqZa6kxrCax18Wrv5xiqpnK3XiW31Qvd
         dHRt1ajum9eRQG3pZuTkeXR0HlhVtDjcZxbYtnq+MIwgklTpOJe2fQs7X50Xv6BnWIxV
         zKQBAyNcBPuGJXUg+WL1LVnLc797aW0YU18j4MNUanq3TP2xoXUOwZQmbF0402h61DOU
         1ZFg==
X-Gm-Message-State: AOJu0YziRl2AqK7FUvssodl4xmzLWq4IsGn9X1gEFadyTHpN9pQ8AGKa
	ARdKPd5k817BhRdgPw6K9AO6BAf5Faqc0Ciazo+jmskQjQOPu/aAY+IVkh0oyko=
X-Google-Smtp-Source: AGHT+IHOVJOP0VpQcVk25AB8u737nThh3XuWqp65dG0kE/mgS+wyNCIL1lVGJyBNR1Jm01ocDs/fKA==
X-Received: by 2002:a17:906:31cd:b0:a37:1f87:33b0 with SMTP id f13-20020a17090631cd00b00a371f8733b0mr816000ejf.13.1706888497815;
        Fri, 02 Feb 2024 07:41:37 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCU54/Xv9yBYsJVhurd9b8NvezMMQWn48AVlvITIq4IowJg+essYYhY9hiRygevu1tYmpTvN6J5p5w7/cAg7LVWcZCDtugFmyoF1n6UDzO125nyA1CQN1VmSbLO0TVAYD9IM7m8qXMvg3qIei5z50ulwK/3Iz7aeDdzDsLneYjBosPAPSCorxZJVTOSv4ScFS89Bdme1nzsHwH+JLvPpSxkE8+yulMlt6qzMCab0LZofgF2k1Vq0Xx2rQ7t637l1Ni7UOD0BAUNFuvyFOnwcbRBlPe1hucyp/teLwGsWQkgwLe+8+5M4
Received: from krzk-bin.. ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id cu9-20020a170906ba8900b00a37116e2885sm624819ejd.84.2024.02.02.07.41.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Feb 2024 07:41:37 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/3] ASoC: codecs: qcom: tx-macro: minor cleanups
Date: Fri,  2 Feb 2024 16:41:31 +0100
Message-Id: <20240202154134.66967-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Few minor cleanups.  The series will conflict with my series:
https://lore.kernel.org/alsa-devel/20240129143534.109196-1-krzysztof.kozlowski@linaro.org/T/#t

Depending what will come in first, I will rebase the other patchset.

Best regards,
Krzysztof

Krzysztof Kozlowski (3):
  ASoC: codecs: tx-macro: Drop unimplemented DMIC clock divider
  ASoC: codecs: tx-macro: Mark AMIC control registers as volatile
  ASoC: codecs: tx-macro: Simplify setting AMIC control

 sound/soc/codecs/lpass-tx-macro.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

-- 
2.34.1

