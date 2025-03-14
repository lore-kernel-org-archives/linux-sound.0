Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E2BD13AA27
	for <linux-sound@vger.kernel.org>; Fri, 14 Mar 2025 17:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741974515; cv=none; b=Axey4l5q1CLNcAViaR/4P+9mZqhrM5IL8MyQpYJ92ctjywOMLhjDB4ESwD/6wW6FemuYRT+dUzI15ldD+S6utDa2Ua1IIMOM86Kx9lBnr4GSHYLQ/SSfC6Zdss164uhCjdvWxNQD/DbE6kEU/MSnBt+Dl+dvqKqpEEQr6tSwUTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741974515; c=relaxed/simple;
	bh=IzDAV+gYsb3R0IxhRne4fUzRoURlhC9ZqkgzyiKPOxM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=e1WLvSiqMbS8kBmk7OwZbYzumn3j5R+qh9wKlWabPOCoq750/xBrsixbLzzQ6VcA0wyqiGpoqCXwZSPHGZfIdpbmiZoVreDCdXJJYPfCxFnX6iXqMD4HOIziVyQONBDPbRg0L0So6w5GoYKvTlgn8DtMj1uDC+bXWSi9SAEbpg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Xx9xDPw7; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xx9xDPw7"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3965c995151so1439854f8f.1
        for <linux-sound@vger.kernel.org>; Fri, 14 Mar 2025 10:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741974512; x=1742579312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SVmcC1q9onxkQ8qIPslGo0PmndpeWfhIGHdL4vH7f4Q=;
        b=Xx9xDPw7WDyjbUVQC3nLmAlFTw7+sfEfXixX+CnjGl1SuJHfK6zhSHJrbkQRiz2j7j
         kUFL+n9K0RXdVsRNys3ziRPE1r3Kcy5AXlP/Z+PYWZ0TD/za/SWTmoCfsxpEMgQmkgjm
         eFpCWWqRbdX1MkIfz1cqB/iDm6CyLC39LiSBaI3R1CWzptrHqgHymdIF0Fw4bq/w5ZrQ
         vXw4lW8QLZFtasGqeLPrSWrkJafvjIx+VQCjBaSg2Gvl8NqiymlhB/kJP2ZRSWytNSBx
         /CLZMf8cEQ2J03ej8xNsagcFm+DhXH3AEEY5WpEwQHMzrpu1NJrYuovUbRp1bxASiYeF
         lxRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741974512; x=1742579312;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SVmcC1q9onxkQ8qIPslGo0PmndpeWfhIGHdL4vH7f4Q=;
        b=fwESKhkHPjfgQSOmPBRL/P7/gfBWdHqVIc5QEZK1ySVPNXjBskOwamF2cQATjS7C/Q
         f7uZ2C3eMwcIxvPRq83m1CbTMWY4SH9SNH9ZY6sNtI4IT/Nz0iwGpTic6QAxoHfPnhj5
         a1KcO4iaR5iA5WvRNzwnRIskjFBEqJF+3MQrZTmkkkuN5G1x20h17JZclygCUWbymKXv
         qqF4aQyFWFhGV+vRU1lHGoE0E3vUc+FC96mBdS6lu/XVsv2OaG7GKnPELXchxJIHCP9Z
         usRoDFFZkpW4jcVe+vBPj0vqL2C/6AE91xTfH4TLo066UAZ7enof1IcUf3PMSlPsxgxC
         ybuw==
X-Forwarded-Encrypted: i=1; AJvYcCV3MDQWvS624w0ZeO8UhsuukieIQ3Rsg15gbcQOv/2Li9uw0ua8qzLbTFB8+kPoRgnNkFW8GYz4DKj/mA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxNI8uIJn2t/gXbeZtunWa0KvYhKA4aOVEJ769W5m3Dhs600duo
	cnkFwsFkjbjtPNZv7dxEClKuNDD/kiXJB8mb2cHMRCNXlqqjEcMYSLZVkDye38s=
X-Gm-Gg: ASbGnct/ful1UP9msU4vTtqlqRNtD5/hPXPNW/ZB2ySiaKwcXjKzwFVClJ6dVsd+q26
	pk8iZijdAaRONUmESwtJS5/fzstTDDiUW8+xszcXoFj0Vhi4GoR+jsiZivM3MSCyaS29FBylW6n
	3yDxeaWqG5ecxeagFNVgIOCfX+Ca/ej8aKx2fCJiGM6I6cwQbAxzCK5rLaNODSCofMKxPcL5hnt
	cZj/k1tCpGPMWmm+6WhruBw93/kgAi2KP+9XOEdTKmrPPaLA6lzNFeeVNd2TomaCxFB7p4TyT1A
	LrcinXz+Ou0Qge80V4s4wnhQ8KPxtfMpsbCgqFGWCJqt6sLPJDNbFEN0wjWL2WjUzn9E3w==
X-Google-Smtp-Source: AGHT+IGtBBkrjkuMMQ03zRppDLDBvMmrjEbEft6rrg1dNIsffYzTsNabU1xGBiuZXms8ctgtipDYpg==
X-Received: by 2002:a05:6000:4022:b0:391:30b9:556c with SMTP id ffacd0b85a97d-3971d237e13mr5115917f8f.21.1741974511674;
        Fri, 14 Mar 2025 10:48:31 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c8975afesm6117243f8f.47.2025.03.14.10.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 10:48:30 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: broonie@kernel.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	krzysztof.kozlowski@linaro.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dmitry.baryshkov@linaro.org,
	johan+linaro@kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v5 0/5] ASoC: q6apm: fix under runs and fragment sizes
Date: Fri, 14 Mar 2025 17:47:55 +0000
Message-Id: <20250314174800.10142-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

On Qualcomm Audioreach setup, some of the audio artifacts are seen in
both recording and playback. These patches fix issues by
1. Adjusting the fragment size that dsp can service.
2. schedule available playback buffers in time for dsp to not hit under runs 
3. remove some of the manual calculations done to get hardware pointer.

With these patches, am able to see significant Audio quality improvements.
I have few more patches to optimize the dsp drivers, but for now am
keeping this series simple to address the underruns and overruns issues
noticed in pipewire setup.

Any testing would be appreciated.

Please note that on pipewire min-latency has to be set to 512 which
reflects the DSP latency requirements of 10ms. You might see audio
artifacts like glitches if you try to play audio below 256 latency.

thanks,
Srini

Change since v4:
	- added tested-by tags, including cc: stable
	- removed a line delete.

Changes since v3:
	- updated period size aligment patch with 10ms period size
	  contstriants.

Changes since v2:
	- dropped patch which is causing regression with pluseaudio.
	- setup period sizes only for capture path
	- fix underruns/overruns in dsp pipelines.
	- add fixes tag
	- add patch to fix buffer alignment

Changes since v1:
	- added new patches to fix the fragment size, pointer
	  calculations
	- updated to schedule only available buffers.


Srinivas Kandagatla (5):
  ASoC: q6apm-dai: schedule all available frames to avoid dsp under-runs
  ASoC: q6apm: add q6apm_get_hw_pointer helper
  ASoC: q6apm-dai: make use of q6apm_get_hw_pointer
  ASoC: qdsp6: q6apm-dai: set 10 ms period and buffer alignment.
  ASoC: qdsp6: q6apm-dai: fix capture pipeline overruns.

 sound/soc/qcom/qdsp6/q6apm-dai.c | 60 +++++++++++++++++---------------
 sound/soc/qcom/qdsp6/q6apm.c     | 18 +++++++++-
 sound/soc/qcom/qdsp6/q6apm.h     |  3 ++
 3 files changed, 52 insertions(+), 29 deletions(-)

-- 
2.39.5

