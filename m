Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20281E49F
	for <linux-sound@vger.kernel.org>; Thu,  5 Dec 2024 02:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733366030; cv=none; b=uJJgM7icgAiskWeMgzugvzzk6er7TV9J47IbOGv+d4swLrUA71y5mHIOBEMe/C3tE1kic1sWoOR+JJ2sCuuuOTXIeWdkpJ5okmY+BwU+xCfxAm0ZcnPpXr/F0A3TIaIySdA/W2rR20JJFqDvTzVwK1xG5e3McVrNM7xAhdfqmh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733366030; c=relaxed/simple;
	bh=jpl9iVOYWeTiM6kCN3P64k/PHIdrq2ziUsX8zdUfXa4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sBNtZXEukCtT9J5ApcsQfmZRwS76pWPqMh+1k03/2Jv7EY9/55dJ+jx/zYqVPHOSAb2FMbm2kL9WekQ1LrCNQjxaop7VHNyRKFJNCRBjUxz4JNEv5DmMJ/J+KUeiCo90a+qGaYgojIb9sge9YFeAcFIK0W0KN00h2oEMa4piHOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xnEOumgz; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xnEOumgz"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43497839b80so2573675e9.2
        for <linux-sound@vger.kernel.org>; Wed, 04 Dec 2024 18:33:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733366027; x=1733970827; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LEvSg5n9dPi25fVhvj+TfkDWWQ8DpWSUc0fAXy4y1N8=;
        b=xnEOumgzs87VUtt8xN8gVEOeFcrc5lUREn41aCvYTsk7FU1GHd7feedvLt2NHseiiN
         cik3i880J+9mc38lBEN2RR/KhmB8+hFjsCGCibyXi8JEexZh3H+xuyGvHVcna2cZQBLt
         JmClvzxoAyn9dg1Ja8hbWrtpffdRCUBMos/rOitmhfz84Tn3kQ94Yrf341eXW9dCSueB
         Tm9xiwnceU9zUH7HQq/igN6lqHGGKU/YpED3KR9ezKMUUol9PFq6u4EXbFs43H36857y
         c4pMsdcvjz+oEOeeMpG+DY3FN0ZpUvv9PwtQhF2XMxH3rOFVPnXfExFWW0JF6Hf+LSkb
         VVgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733366027; x=1733970827;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LEvSg5n9dPi25fVhvj+TfkDWWQ8DpWSUc0fAXy4y1N8=;
        b=ResurnX4glRNrI4KSWKygK5Oo8qaJYUxTZg1FmqFj6c74J9Y9ir/hEd5sBkmMcWCHS
         6W4c0lUoIio/lUv+VKNAfIhaZtEfmpIlGhq/TB2dVO8DToVn18Wn2ylnRBrdm6gSljy5
         TbJgmOq5zcd521GAHzaAXjRSkzHza4sZIh1miLNw0MruPNODj1SANYOFQlLg18qXNIkl
         ki6KeD7E1pGXh+G3QNiz7ZpiWYZgzSCoJevg6yb5HzbPz9cP9AyFcYoR/gWk0o6Ab/SI
         o/ZDMTBnqEZkeo4SzSn4IbUUmmazgMgk3tTW9Euvp7AhC12ePppUv+1X/820OFy5SHS5
         FXXg==
X-Forwarded-Encrypted: i=1; AJvYcCV80qyzW3cgPadmu4ZXW/AIHtA1s2Gk3HXu67HHQAIdtHJgLZZqycfB/tcOJZb6NHn+s3USuFCYnMnmQA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfIyBHk36AwW2cjmqnN2TCNkeFzh8cGQ/50kyczRbR7uNFJ4D2
	32MHiHNeLeoCeawKOwb9dS9lB8ez3upuxF+DuZHXsZKG3auHqL6vlMnKJePGZa0=
X-Gm-Gg: ASbGnctKjzcHP7HZeIoEGlb+0gGTTvFJR51TrWWLKMchiuwAr7fZjZIjREKMREFXbeN
	9m50pqazriFLbPh8F9RPJ51fe0y2se9o6YGYxc9N/stLHpQIAOj1IrZxOPPIjAzT8bWrhpzYweb
	Yz7JIm5Zkmg66bGaWXhwvsA5iMKFeNlDJCoreYZVKbc/sKeCRIsv61A7EOGfCyinFBsUARTx+ou
	kyTcjQJWb3GYuB2JmFp1MSBl7Svjs9Hx1EmdpP+AW227SZKl6AI8xI8WBtlOhDxm0x0
X-Google-Smtp-Source: AGHT+IHh2by/doGLjpPWCzeNRn54791OntfvKje7jWHAMUb5dn6DTgMFuSYzcKySXVmKinBfVAjamw==
X-Received: by 2002:a5d:5f46:0:b0:385:f349:ffe7 with SMTP id ffacd0b85a97d-38607ab5c9bmr5625677f8f.2.1733366026988;
        Wed, 04 Dec 2024 18:33:46 -0800 (PST)
Received: from localhost.localdomain ([2.222.231.247])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d5273440sm44444325e9.18.2024.12.04.18.33.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 18:33:46 -0800 (PST)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: broonie@kernel.org,
	konradybcio@kernel.org,
	andersson@kernel.org,
	srinivas.kandagatla@linaro.org
Cc: tiwai@suse.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dmitry.baryshkov@linaro.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/3] db845c/rb3: add i2s playback support
Date: Thu,  5 Dec 2024 02:33:41 +0000
Message-ID: <20241205023344.2232529-1-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are i2s signals provided in low-speed connector on such boards
as required by 96boards spec. Looks like it is possible to actually
playback something via these pins after adding missing parts here
and there.

I tested simple widely available cheap DACs like UDA1334 and PCM5102A
and they works just fine without need for mclk. I guess any DAC that
can handle 48 kHz and 16bit will do.

In theory db845 can work without mezzanine board and this provides
one more use-case to playback sound and not all mezzanines have cosy
audio connectors.

After staring at
https://patchwork.kernel.org/project/linux-arm-kernel/patch/20210621074152.306362-1-judyhsiao@chromium.org/
I suspect that this might not gonna fly since it requires dummy codec.
Or maybe specific half-dummy qcom codec for such use-case is required to
verify hw parameters. Couldn't say.

Alexey Klimov (3):
  ASoC: qcom: common: set codecless link to be a backend
  ASoC: qcom: sdm845: add handling of secondary MI2S clock
  arm64: dts: qcom: sdm845-db845c: add i2s playback support via LS1
    connector

 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 43 +++++++++++++++++++++-
 sound/soc/qcom/common.c                    |  4 ++
 sound/soc/qcom/sdm845.c                    |  5 ++-
 3 files changed, 48 insertions(+), 4 deletions(-)

-- 
2.45.2

