Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C1730C175
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 15:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779809408; cv=none; b=ZdoMVcOLxWiwV9CJVq73N4nh2Z78Kl9yZu+v+B+O+gsLAUyvYp+6OrzKdlD0I7CuztiGPwYzBbf30NeFuU9MWHG4gfttQq44IcJBq7m1IheU8OI/EaVO4wrSxxJZTL6sJLuBWjjOySVrz8Or0FFwfYPVU3gV/tWAKUtoZo4TvwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779809408; c=relaxed/simple;
	bh=d5No5p2kPGYPEeCcwPbvtzn0vYshvW4XXLjtHG58mNs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nPR7rgJU7D0Oyf1VzB5ww/sxFSIR53cvWeZzRsh1Wdk0LDkHoDaxAebAoKM5hU8MUF0qQ4wDbzqpTPfW54lLWIIKOLlDa71gV20LeEAgsdj4/ezeJ8v9N32zepUt9Xzi418D4C/6J0BuloEgSDMojLDP44Ps8pWteZjSTW9Cwfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=zC21jxOL; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="zC21jxOL"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-44c350a5b87so6377250f8f.3
        for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 08:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1779809402; x=1780414202; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Izp9MZRfDJ61whqJr+eGkWfgZt9VEoIk4csFEn366E=;
        b=zC21jxOLAGFNXO/HHhONuDs2YGouoRLpPQP9jYirJdq4MDkDmVgbc2+3tD+xQLnHc0
         0UCFzqLNQ66w2/UU+0SsE1osKpNh0dxfwmeZIddv+G+ZD8ef2QSW2USsVnyuKgckEh6r
         zkhEZFDO6ee+0N4o/Na0v0pLiyECKDcExkZHXIfxJw65rTGe7uF4mM6OHL6mdq8aB0v2
         5g/KENckNW46rOGAq4oprX6Ta+F21F2Sz+t+yrDb4jegTXS8XRO6DgFBDLHjhumKMcaP
         /v7qnFgQ+IXHnDe5AcaVQp8rZQSZswrg5uyGywKlJTZ/AtRKysdcXWl/BbLr/aVHRzb9
         xgsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779809402; x=1780414202;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9Izp9MZRfDJ61whqJr+eGkWfgZt9VEoIk4csFEn366E=;
        b=QIp6vFAYHObdb1He6m2Q3GJVlhDHshqPv2MllYHcBejYfrBEPUuO8v8XKNLXEhnsto
         ouz6A96TO/SOUvkyTBqoDihOI0s/Dpodt6oLHaNVzxFn8KWamDiG+kSOvvxuTJWw0E3l
         COLnXdLdTESLeMqeX6q/GZtpDTn05R09MoBs1fKvqlfpNKjKk94fPzQkwhsjY+MvYq0c
         7IMtKqwK/S5d2SbrNgaoXMhUwcwhZ3qVZ6Vpv3KDSFDLE1Ti+gYZ0v20G7lWr3CYz1Xc
         S3lH57npECQrOt5ab6TQpIEG5RydHSvzTUXCtCpLq4kBPDsxQ/Wp0iyuSS1kFZboueY9
         9teA==
X-Forwarded-Encrypted: i=1; AFNElJ9NdSNCqP7xUcltS9n5x2ahJ+LfZytD3P3FAfvZ09yJQqTn/IIQC4a4HPgOBzB+4F/1zAuJ/EW76IpbPQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxaawd7axeHFaWjZQgo7Tz3jP77N4c9sasU/eN5cpH9mpuzagDu
	tp66nXdAxc5an75ln63FfXT2k8bTtnVnlmUaCVXjAOsR+TPfTgiDr7n1lhV+MPI8BZc=
X-Gm-Gg: Acq92OGgA8cOiOZLZA/UI/U2SObt91sy4UfqxYYqN4OWTYtF3WG1t0uxiQDM9cP+fGG
	Ry+FFDQbGFTopqT3lJefUfIRcITqfa9MUcLGGG7xBjdAtKQ80xU0L1Za+t8DQ0FUaTf4i+LI3zm
	MOMPg5XuHXOVzKHpuGRB/kKRJvMDuBZlhkg4xyHbBqPqYzkT9yizvDZSrdJRFDDRcR5ODsD6c+C
	BdcyheD/6sAbDIidaSZpPhpYnvGn5cYBHUWSoqnjV8uirATEXKR2A69H5PB7SCeiGmneHLKOLV6
	e/Rnr3xB2QUIa85q5vxek4XiL64P4KwbCfDXFiArS0tXIMW22/Q3ABiWBabL+GTvFWMBWUudlBh
	+9GpNqm4CgU4Zj6f4gICRy8UBfiYIqRsLzvXF1b54uvh3bgrts3s77Dar/0f3NyOajJ1kYFrMPu
	Lbx1JJ2GiC/OhK/ywm750m1RxIEUSQSqxa
X-Received: by 2002:a05:6000:25fd:b0:43c:fa96:d939 with SMTP id ffacd0b85a97d-45eb38a66f0mr30090550f8f.22.1779809402180;
        Tue, 26 May 2026 08:30:02 -0700 (PDT)
Received: from [10.107.1.102] ([212.133.41.39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d5caeesm37691140f8f.29.2026.05.26.08.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 08:30:01 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Tue, 26 May 2026 17:29:54 +0200
Subject: [PATCH RFC 1/2] ASoC: codecs: lpass-tx-macro: Use correct config
 for sc7280
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-sc7280-tx-macro-v1-1-1aad6900fec0@fairphone.com>
References: <20260526-sc7280-tx-macro-v1-0-1aad6900fec0@fairphone.com>
In-Reply-To: <20260526-sc7280-tx-macro-v1-0-1aad6900fec0@fairphone.com>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779809398; l=1167;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=d5No5p2kPGYPEeCcwPbvtzn0vYshvW4XXLjtHG58mNs=;
 b=uAdZLNZsfUX4RLp9inUuLMDBsGewFvqrwfJwhlCgMSPgkhFLi8YtiiUMO4qU+M5ZSEnUl9sda
 vCC7PvpT73ODFseHSnV08jqTGnUAaQpiKw5RTnjNyzscsY3xst+kPOQ
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

With the v9 data, the controls will have completely wrong names and
using wrong code paths that do not apply to v9.4.

Note, that this will change control names so it's a breaking change.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 sound/soc/codecs/lpass-tx-macro.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
index f7d168f557dd..7f93ab0c3872 100644
--- a/sound/soc/codecs/lpass-tx-macro.c
+++ b/sound/soc/codecs/lpass-tx-macro.c
@@ -2493,14 +2493,9 @@ static const struct tx_macro_data lpass_ver_11 = {
 
 static const struct of_device_id tx_macro_dt_match[] = {
 	{
-		/*
-		 * The block is actually LPASS v9.4, but keep LPASS v9 match
-		 * data and audio widgets, due to compatibility reasons.
-		 * Microphones are working on SC7280 fine, so apparently the fix
-		 * is not necessary.
-		 */
 		.compatible = "qcom,sc7280-lpass-tx-macro",
-		.data = &lpass_ver_9,
+		/* LPASS v9.4 */
+		.data = &lpass_ver_9_2,
 	}, {
 		.compatible = "qcom,sm6115-lpass-tx-macro",
 		.data = &lpass_ver_10_sm6115,

-- 
2.54.0

