Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB8B3B4439
	for <linux-sound@vger.kernel.org>; Tue,  9 Jun 2026 16:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781022183; cv=none; b=gxe0317qX+Z1+C5KDhMxNfF/Qna7Mltqnx8Egk0zNf5qm+owZZQJJCt9diio5e7kvFneTdOo1qbx7n7BvW2jA1Aerr8JPcKSdPeiPd7Qi3BYdSu+qPRQUNBuQD2OX0pdcnXbEQOR15uLNTgLArf8OtQB9yvEhvyVDbT8AD/9ByM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781022183; c=relaxed/simple;
	bh=AeGIWM01cEy8wx/Ywn2gwtkQshceFsOvLf1UYfjPakY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KtwUtm2lWKVt4mHM1JAdy58bHLZ2wN4rmsJiijcSswcWyaPVY6BGbAEZ+GNPajIEU48OwAPmGLbgBnn42Cb+2YOOxVsihiKvahxWazG1XzFwvi92tWQIB95TqWdrth2aY4xEsyX/ZKSf77+WkjdkS1K+xeNq5Rjv3uEPFtXMHBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Br91IK60; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Br91IK60"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-8ccf18ef922so80462626d6.3
        for <linux-sound@vger.kernel.org>; Tue, 09 Jun 2026 09:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781022181; x=1781626981; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PxrmblCHxPYTYWGagnmJNDYlhKvZUH0GTSCNjpfZ6R0=;
        b=Br91IK608+GqEQoaoKY35QhRcHF9oKwR/zI1nPuvC4xN+6EMzmfveNQT/Y1sien6FT
         4SO94tO6sn4W3BC/RMWktikd93LQEUYu8ydXnAxb/xcpQDXCaHNKaHu0B1ZzYoOFraap
         MyMfxJMy/P0y1TGi4DQqqtR7FdskSoPFktwZszwPUrwBHn3K0USy3707q8J21Lve08hg
         54q5xH380Tt6QfxV4eLyJY0ssXJFnNoOf/nlDixsQjCo99+/BUODGdtBjW78y/80ROui
         y8mb8cPeTYox3eI6RR9X8b7WSnXds4+1qcWEJNz4P9YNxLe82lrggDA7+EKDsraJtsSK
         r1qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781022181; x=1781626981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PxrmblCHxPYTYWGagnmJNDYlhKvZUH0GTSCNjpfZ6R0=;
        b=in2g4nOtbQSMEf2CzMag4A7NX8FVlKMeb1v+1IMMgG+LhNMZzZ8wxPOF8JfdojJnqn
         VKML2DjJQaD7iza5FYDG6o00eUT6c84HIhCtlrtI0i5SyYteNLDnRiraNDX3n05lWGTo
         H2CfuxutnieJ9N0h1n9fuGwgiZUBTO0cjqexlYAdwkvVqNBJR/6Hg+pwWTZdV6b+pmBP
         2GNojMKUZYGa+7qnWWCyCYnMz96O2sWxhLQeUPFdDe+4b+CbaalZy5tNci1QL/YP1cTI
         NJME1R8OeLXNi2rX63NapSLnJyWQJ1bcYI1+/mPGax94OcSiYaird1QGpge7Qsh7Be2x
         G1+A==
X-Forwarded-Encrypted: i=1; AFNElJ/vsi+zxchDrOMdpZzaAOuTylq1KXxmCicEzXU3qnVjijAJruabL0uTxGclnkwTPV5tY/6mpeK9KNw5pw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXMSYGCBoR6oKuhycOWOB3bV0zX28zqycxt7NWuYuStPDZMHWu
	D4zvEMEa5ox1ukcSLA6xkGkuZlLHiLLqsXSMVwpTHR87NMhWBMo5pJNl
X-Gm-Gg: Acq92OGeWn+ZR1KAZWVLaWZwWrPfzFZ+PBdrKlU+mrbUj2mtuwsF+la1rUXdGbm81+V
	vUdIQQXaG9LyTQZyPX4kenuBXxvVsYFn7GaDIihiCZivUvNLM1Lzt11c8NG+iAnzxpwg0e04VxL
	eQdwEyzN6KmYPrGdtPsxlEOfYcMvj8o1agiH2V0cOfFR0MvqHOQXmsOUljwIU8jrS+Mu3yhO/ak
	FCrMcTYSpyN9LtOdgc1F74pC+3e2pYbltTqGrnEH0pXgC1oZW+saRJr61SlxFCYxrsWKrhuSbRj
	PB/z+84r+WCyRYsUkYtOz+H2Nrt/JDyliGxaZMJx+jW3F5SUfqZg/F6W4DLfMWdcheaJEMEKQX/
	hUfljL2O3UgyETw/Im9lX+hPt8aWZBpdfucQrSAEBYRtYEWYSGoWjpjCX+BdLYyRoLj0XgrXuAw
	/P3C51WJNEvBPqHmT0E71nQmt1A7sH4sirtcL2bPHIl7xXDKe+
X-Received: by 2002:a0c:f146:0:20b0:8cc:f074:95e with SMTP id 6a1803df08f44-8cee61337camr273970516d6.30.1781022180931;
        Tue, 09 Jun 2026 09:23:00 -0700 (PDT)
Received: from localhost ([142.181.163.192])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ceccdc91cesm205664046d6.19.2026.06.09.09.22.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 09:23:00 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Nickolay Goppen <setotau@mainlining.org>,
	Adam Skladowski <a39.skl@gmail.com>,
	Vladimir Lypak <vladimir.lypak@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	Johan Hovold <johan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v5 02/15] ASoC: dt-bindings: qcom: q6dsp: add support for lpi mi2s ports 5-6
Date: Tue,  9 Jun 2026 12:22:42 -0400
Message-ID: <20260609162255.31074-3-mailingradian@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260609162255.31074-1-mailingradian@gmail.com>
References: <20260609162255.31074-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are 7 internal MI2S ports per direction found on devices with the
internal sound card for Snapdragon 660. This is similar to the LPI MI2S
ports, and the LPI MI2S bindings can be reused for internal MI2S. Extend
the bindings for LPI MI2S ports to accommodate the internal MI2S ports.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 .../devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml     | 4 ++--
 include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h            | 4 ++++
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml b/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml
index 2b27d6c8f58f..3b03e2acd67e 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml
@@ -127,7 +127,7 @@ patternProperties:
               contains:
                 # MI2S DAI ID range PRIMARY_MI2S_RX - QUATERNARY_MI2S_TX and
                 # QUINARY_MI2S_RX - QUINARY_MI2S_TX and
-                # LPI_MI2S_RX_0 - SENARY_MI2S_TX
+                # LPI_MI2S_RX_0 - LPI_MI2S_TX_6
                 items:
                   oneOf:
                     - minimum: 16
@@ -135,7 +135,7 @@ patternProperties:
                     - minimum: 127
                       maximum: 128
                     - minimum: 137
-                      maximum: 148
+                      maximum: 152
         then:
           required:
             - qcom,sd-lines
diff --git a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
index 45850f2d4342..f0a6899b6523 100644
--- a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
+++ b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
@@ -152,6 +152,10 @@
 #define LPI_MI2S_TX_4		146
 #define SENARY_MI2S_RX		147
 #define SENARY_MI2S_TX		148
+#define LPI_MI2S_RX_5		149
+#define LPI_MI2S_TX_5		150
+#define LPI_MI2S_RX_6		151
+#define LPI_MI2S_TX_6		152
 
 #define LPASS_CLK_ID_PRI_MI2S_IBIT	1
 #define LPASS_CLK_ID_PRI_MI2S_EBIT	2
-- 
2.54.0

