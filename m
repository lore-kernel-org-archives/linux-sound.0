Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72CDB3E3D9D
	for <linux-sound@vger.kernel.org>; Tue, 31 Mar 2026 19:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774985959; cv=none; b=q3M6KCXIC+kvPWPmN0UpgHu41ptpQDcmYsak0+WeQlvRLwRFkdql6BRNqp2B0dCtmQ5e5xpsTf1pcwGa1uOGCAX4806VaLUbCHZG6HR426aDeu/+BjXAdeVhIoUHYyODiifb0OTgUL2kEKG4G9HWsQXZVCuC5svJL2hGjrQWLNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774985959; c=relaxed/simple;
	bh=lR1IVDRMJkZXoDslp4/dph1T2GakLoRbrBddRQrqVXs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hgIJ5X5OAvMi8pnk/H6NMKLjpljdZjG0gvqVa/3vdDwZeGX+7iONspJcvErjpZ7v+2SBnD7HHtySztc3vsn3JT791q+YWM+CUd+u/Yrien07hDWY6lWPRHsRVWlw9z1Wd4ivaPMcQtJOQNeKb09H/+Kskuy4+Vc+RAlqMWtvOec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YarCvP1g; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YarCvP1g"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-506251815a3so51287981cf.0
        for <linux-sound@vger.kernel.org>; Tue, 31 Mar 2026 12:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774985957; x=1775590757; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wnPc8TBTfWgiuHY5fV7Z5G19bPt1vmYlz98f9MexdKc=;
        b=YarCvP1gUlFmVvf2hCDW3A0c6+Yqx3WeGnh//2eJbIqaLH/lgArtmXpeuVU5hNE7mJ
         gCmjvri4hhhroIuOta3NgC1/DcOyxiIzDJsx3gj+Q/RB8d6am8hFfUDz73218N8ddHNp
         6f0MRemboY+gLHfrCHcjiC854qzJKU3QPl4uG110QJCWlkwhK3x1/XaLRo/8h87WOZ70
         s8raU1WLINH33vUHuZj9xqKE5ytGE6GSDrfKzv7W7gvSFUs3u6ZLaxej0Ui4HdwmGQIo
         v6oAmbOFDKSV2OBHoRz1di2YoQ/s3z3gCFYtCI3yajHALyN3BG8OmZffDOt4UiB4hEwE
         pPAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774985957; x=1775590757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wnPc8TBTfWgiuHY5fV7Z5G19bPt1vmYlz98f9MexdKc=;
        b=aLFCqZuqFJj70qJPp+Kg9leWTABMxypCV3KTgTZdQlANzbv278zzLUSGS5ixyBp4Fg
         JLGfTGT3LntDLxq5b+x4v6Me03HiTz4PVp0DsKEz43yRwxBc1fHxjkV9sqAVUAdFGl/R
         V5B76yWZsjLozzLhJ0sYqyDV/u4hqMdFvjNaMrfGSWu+foqAn6z2vc8rvtjK2q2NXCBG
         hLymzO74D81DA7cqqOv0XW9LHZ7Y+YJ9C8OZoUT4bef8oYYzCijvAdMNLOR5Rw7xF4sy
         0twa44c4FoWl6k2qpXdjQP8+GA44JSILOr4ynsaNQXkRer1SmxaJR+rqJ3oUY9OeLhMr
         UDsg==
X-Forwarded-Encrypted: i=1; AJvYcCX+sUvbraZc2IztOkMePCoQm07XeJibKp7Ay7nA5VL2OayF2hDbGGoUbo8IVLNVhCrlrOwqowua6WyM8g==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywmu8GCxINomhG5N3CcUBK5xRK4+OTNLqmh+a9tTWZHBrlmFZdZ
	FaLfwLrvL4flvk0aZIweALgPEbIVNWHdq97BfKPFplSYAFvBZ5ln5UDO
X-Gm-Gg: ATEYQzy4VFIxNHDnoW/jftsMjoyR5spK1ZRR+ESI5j56LY3ySz0uxPv6YfSOj0xDByj
	cOP1zBUIER1NsjneeH+/eCRESto0ao8ipFrZDCfjCY/U56WYGkmOJBNxan5hKQmSjxprRhwN+Ec
	Emg+L/MqFsMQhvjw9fZafAZF7iV12LBEJQPcx1iCFAFlui6Qws8A/6s93FSDs8H7iynwSIcp/Ku
	lq7vAR8uflLc2BZ1Nl/Ta2014sDn6ARGBB7rQC/Brltcnv2SMLlDQGTgcaVuL+91AGuJNdeF8J8
	iFIoE5lPKQ/Bs1c1cUySbbxbt1GekgxA2tFPyX34P4bfNadX9w+PlT6yQ0LzmGgMn46EALuHjUq
	xBDUb6u5y+Onmg71snMNC4MdEqx2ZujC6PJzlEgspkO0EjdF75N8gYGscV+qEKdrFV40CuuZ8T6
	UdY2F+lc+ymIQlZSRGy/5VKKO6
X-Received: by 2002:a05:622a:4c84:b0:50b:54e8:39a3 with SMTP id d75a77b69052e-50d3bb92d1emr11419271cf.2.1774985957355;
        Tue, 31 Mar 2026 12:39:17 -0700 (PDT)
Received: from localhost ([199.7.157.124])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50bcb86b9c6sm83566501cf.9.2026.03.31.12.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 12:39:16 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Nickolay Goppen <setotau@mainlining.org>,
	Adam Skladowski <a39.skl@gmail.com>,
	Vladimir Lypak <vladimir.lypak@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v3 05/15] ASoC: dt-bindings: msm8916-digital-codec: Add SDM660 compatible
Date: Tue, 31 Mar 2026 15:39:29 -0400
Message-ID: <20260331193939.40636-6-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331193939.40636-1-mailingradian@gmail.com>
References: <20260331193939.40636-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MSM8916 digital codec is also found on SDM660, typically connected to
the SDM660 internal sound card. Provide a space
for specific compatibles and add the compatible for SDM660.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/sound/qcom,msm8916-wcd-digital-codec.yaml    | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,msm8916-wcd-digital-codec.yaml b/Documentation/devicetree/bindings/sound/qcom,msm8916-wcd-digital-codec.yaml
index a899c4e7c1c9..33bc23b6176a 100644
--- a/Documentation/devicetree/bindings/sound/qcom,msm8916-wcd-digital-codec.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,msm8916-wcd-digital-codec.yaml
@@ -14,7 +14,13 @@ description:
 
 properties:
   compatible:
-    const: qcom,msm8916-wcd-digital-codec
+    oneOf:
+      - items:
+          - enum:
+              - qcom,sdm660-wcd-digital-codec
+          - const: qcom,msm8916-wcd-digital-codec
+
+      - const: qcom,msm8916-wcd-digital-codec
 
   reg:
     maxItems: 1
-- 
2.53.0

