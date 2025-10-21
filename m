Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B30E338936
	for <linux-sound@vger.kernel.org>; Tue, 21 Oct 2025 13:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761054665; cv=none; b=BFxGlcwg0AoRFX8PVEsH3t7iojamVIUDwbQbE7Gu+U5Aer5DIEe8dD426rE732vloeroxyxZNyKkbtqIpmwI4qV5Qo7n28zWqSEsURyDHu/0+1jtCGbCNmritdi+HZKgtydloqxMvQhE9pWskZ7uZP/5N0GKp4BpPvdUOFVuo7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761054665; c=relaxed/simple;
	bh=rdLLYhnz/5uqn7buFD6pzFSbbx+bpgXyOsq7aLCDz9k=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=P/K1sQVSmMtMQUDol5+icDK0emGC6KrGgOortXFVb7otMetxoz0LGoY3Q/9Ib5urR2JqxaLETfuYCZm2569xd7zK25LbMUy1YmUuAcdmOH2wSq60OR1mta77dFrajtESr8U85DZ0v5M/zXS8gNKt58Xxfm7DMMnX7Tc5UiZckpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HO6NUCU5; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HO6NUCU5"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3f99ac9acc4so1150960f8f.3
        for <linux-sound@vger.kernel.org>; Tue, 21 Oct 2025 06:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761054660; x=1761659460; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7Pj1UWMB1Vw7tjSrrq36RtqXa78b52SGuEyk/FfhX/0=;
        b=HO6NUCU5c8+ykHKyKzohptzbcbrlXofhGwckN4PnH5oVYnRPMiGheMU6hafswb0QPE
         CQ3oO+sEcU0+D0O9MuuVgd2mrbLSAkerubUu/nC/Ixj58RcLepQPyh+N0EJqBKgoWpga
         7buIe9/3P1MjBAxU/zd7aVp3EztEvXiMFrE9qrZj12u1TkhhtSU7fsqy1sUwrRYWVBwT
         TVJYRkrbiOqPmOJJhzps6t/ZlHRou50+Rt0pCwKSY9rZNKCJSCVUtVR6mCKkeFGcWox9
         Swe2Q0j+gmom53Kil5NeMNXSi6L9psWXbUx47GVhqW7Foof9Tg/mcyErKFKYPk0qRPBr
         nyTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761054660; x=1761659460;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Pj1UWMB1Vw7tjSrrq36RtqXa78b52SGuEyk/FfhX/0=;
        b=olPTsWo8Uy7NgZl0zb14JUQiqAufU1bdgKFRUyG5gswiJd3kJ5okp8u4tK/J8Ogyu8
         o6WFAS7ZAXWpMc9qB5K8bvpHY2p0AuBjLbMZ9XalA93AmuyIFp6HMWzm0ecpndV8atIM
         NQDYIVHzAl6uhKHPnN6Oojq0aBeVuSbPTicCshM90vc+sYUiwJuwpAxHpemlAZ456yfh
         zwzxngHtDIK1r89CdqhcSM22owLhsDkCKyPUe4PF+3P4tqzSvfRJPgBCugTh7QDq+AaJ
         1EJkVXeRmPbLf+h6Zqn/zIpWY3qBk0w8I/zW9hobbf2AlU1bQ/Qs1g1hBy4frVJ+nfx5
         Rk9Q==
X-Gm-Message-State: AOJu0YzZDZ4qJukkB7SJAYiWvxbh9J316LJTDzjUpEjH3yWiBjdToWYi
	QQKyUoD7f+WTo11ypWKm596U4tGUfXwaxz63FDQyX4fnAR/eVZUAtKlyIquH7Kyo3bE=
X-Gm-Gg: ASbGnctxf2dnv+kqyb3dBPwbERov73JA0GOW9DfJtdsTUYL1iGqOWYAzrmsxoqrH9b0
	5/U3oB2chuQCLTE9Gne6SX5BplMBbKelYoboYx0wh46cRgK+LvzIL4b03fAbtd59IQrXmx6RwlJ
	RAbgAmTKars74fQWdtomrpEq2JjuWph2gGOu6SL9U34xzEvij2llbh8jz1xMpVJ3o/gsc3UfDBN
	tPqJqrwPSpOjxJwPuGFx6sIsFIVgaurwyRMBLJSy7zLFqM6HXuep8VaEAj2+bznjOfQ1jvmPkaz
	j/oGYcH9fKhQdBRrHf8PzA1lw/nReZJ5MzJL+DWlenXAZsWYHNRP6ryktAG22qpYKYStuoaKOwr
	GS+VFb4dRidZq1uQTIdKbUIicCHdUUC7HB0D2Xya/Bi3rEj03CMid5T7SaALGZtd2bx3WovJifR
	geii4izhAA
X-Google-Smtp-Source: AGHT+IFq6wr67qH/uGO3hBDH2oknXsC+DV4koXxpX4MnvU93BRmy377dpIqcZLgtKEVXCYORZWyXkA==
X-Received: by 2002:a5d:5f82:0:b0:3e8:9e32:38f8 with SMTP id ffacd0b85a97d-42704d8d596mr13039582f8f.14.1761054660187;
        Tue, 21 Oct 2025 06:51:00 -0700 (PDT)
Received: from hackbox.lan ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f00b97f8sm20124378f8f.36.2025.10.21.06.50.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 06:50:59 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH RFC 0/3] ASoC: qcom: x1e80100: Add sound card support for
 Dell XPS13 9345
Date: Tue, 21 Oct 2025 16:50:43 +0300
Message-Id: <20251021-dell-xps13-9345-enable-audio-v1-0-6f3f6bbd977b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALOP92gC/x3MQQrCMBAF0KuUWTvQpJYQt4IH6FZcJM6vDoS0J
 CiF0rsbXL7N26miKCpdup0Kvlp1yQ3m1NHzHfILrNJMtrej6a1hQUq8rdUM7IfzyMghJnD4iC7
 svI9zFAcHoVasBbNu//5O0+1Kj+P4ARJAmrZzAAAA
X-Change-ID: 20251021-dell-xps13-9345-enable-audio-799bfbd7e7ed
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>, 
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>, 
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1325; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=rdLLYhnz/5uqn7buFD6pzFSbbx+bpgXyOsq7aLCDz9k=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBo94+6bhciv61eugRTaa0thyKn4Odp79VugQm6/
 +KHKm7InfOJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaPePugAKCRAbX0TJAJUV
 VoYoEAC/wDSEaoYU8yjuc2Yx3niR1EiFYljIEeRvCaJMVM/CS17mfo9OY5KNzlKE2mwLK9VHvqI
 og/Kwj0PT9B531KqA9ZRU338PzAhtI/MlJyKEHSalczvbSSmE+cPkd28kO7/TGiJDoGYF5RUbIk
 YWScPBswFwdB5RLnrZl3F6bx0QDrlieTjKyTOnZUZpCSB9dA/oT6Ux2E6Q2CTQEfEOO+hBfzgX4
 mcQhYeGzg0JdLr/HaB7SxBTA8HGO4zpMT0Gw5aaCyUBxMvT489VXAdd0I9UDK4Q92FdZYbYL3Ht
 pWFISA6VNab++XdP3f3mqqqnN5EonpTSzJkYxZebiYBRsFG/R5SJZPmO/WYfu0Fw5F2mdfatQ22
 p49MhwbuD+4JlOGRLP3LMkrdehCBW14DdQfFsOinugY5en8kl/8hiZAtTOxvhTkv2MVdcNi6Jcd
 /NKUT6sjHnb7D8dcia3QdiMXVdoFB59KDwA9IssfhQ9wJ2dS2FtgEGD1GxryhlnQIx4gRoK+gv3
 0C8+3EZ/P8Mj172qsy5KHZIYAuYWvBhJfLmFVCbVFvSS93WpZ2pmTTxN+H281+r7im+gPpfSK9u
 WkiMoSwpA+9BytdzNl4Jom0siTth3b+xP/zk0ZOXp0vBnXM8V1aoumi8H9WBGHTJmz9VF+CWjIM
 psH9VLlejLM6prg==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

The current X Elite driver for sound card is mapping the channels from
left to right on all X Elite based laptops. The Dell XPS13 9345 seems to
be the one-off when the speakers/tweeters are mapped starting from right
to left.

So rework the driver to bring in a swapped mapping for 4 channels setups
and use it with the dedicated XPS13 compatible.

The devicetree node is included for proof-of-concept purposes.

Sending this as an RFC since it probably will need more discussion
before settling on the approach on how to handle this properly on future
devices.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
Abel Vesa (2):
      ASoC: dt-bindings: qcom,sm8250: Add Dell XPS13 9345 sound card
      ASoC: qcom: x1e80100: Add Dell XPS13 9345 support

Sibi Sankar (1):
      arm64: dts: qcom: x1e80100-dell-xps13-9345: Add Left/Right Speakers and Tweeter

 .../devicetree/bindings/sound/qcom,sm8250.yaml     |   1 +
 .../boot/dts/qcom/x1e80100-dell-xps13-9345.dts     | 139 +++++++++++++++++++++
 sound/soc/qcom/x1e80100.c                          |  49 +++++++-
 3 files changed, 184 insertions(+), 5 deletions(-)
---
base-commit: fe45352cd106ae41b5ad3f0066c2e54dbb2dfd70
change-id: 20251021-dell-xps13-9345-enable-audio-799bfbd7e7ed

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>

