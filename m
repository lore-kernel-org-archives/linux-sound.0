Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B5847A875
	for <linux-sound@vger.kernel.org>; Mon,  7 Sep 2026 12:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788783266; cv=none; b=UJNRPHBy2Z6N/7t5KxodGnEW4AxREySou9FzLkXR+k4QNByzdQfSaqZXcPpeQAfvNC3na4kkNKj5F2+Vum7JPjVBxbmZ3G/kPYEaIGkwKaGatCkWbCSL+Gl1JyWTdTw0mV7Ibr5eJLw/iiUMO6xvQoroIL4n2/j4p5GwPj1ulQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788783266; c=relaxed/simple;
	bh=UTrnTwVr0/6BvSqXaWbnJ6AR2vQZSFhfgdbJrJZ3Bkc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MzxFgh5HK3RmDXPwzynScBCEpOJ4nQIFzo7iR8I/6cMHNR+Y5L3X7ixDd1Khwb578fNkt9ubIoBIVoSam8ef3VSDwzqsJ3XrEA98eMDjhXo9mJOjwrauVq2vrxPNiCrlfodLreGym5sFKial1/a0hpp05vxkgtwDYhAotX+9nXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VFMzCKt+; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VFMzCKt+"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6a5e392b2b3so5448611a12.1
        for <linux-sound@vger.kernel.org>; Mon, 07 Sep 2026 05:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788783262; x=1789388062; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HYyEbC+uMh1/QUV58z0d9bHJ82hstcEg9VU6J+GXbrM=;
        b=VFMzCKt+LqgUo/hNkIKsR1DV+GYSQgrAjJIlRNKu6Tyz36vLwk8qeRTrFJ9E9AIXSH
         TQNF7sZcoCld2BwPsBn8We9TbsfiQqsrG6skMkmyA+m7eMsPS923vbT7qc7EdwFX4roz
         doT1WDM96DTCgnT6KTOjM3OFDqpo/pVkrC+nexp2UL4QyNwTX+wYHEvA+Y7vdwehzfng
         71x0VYlgUOqNEn6SNBqGgwTCj34IyO2jEjbsc8GLnKesgAw8aUrkk48L8AlK6xiny3Cj
         Vo4/V2+W2k2vA8dihN/9BnIbv/obDyfcp2wBciI7J3LaVn25+mMtcoX1R+qQDP5Qubjw
         MypA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788783262; x=1789388062;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HYyEbC+uMh1/QUV58z0d9bHJ82hstcEg9VU6J+GXbrM=;
        b=GP7u+ev2yIJEdwi+8JM3I0RQHiAQLCJFFSU8aD3vgobJUGM7ABOw7FXXMf+oarYtYf
         c1k7EqttLaGD2E429ZnyQP000zomFcbdflBa/wFLIiOBNYDXuIo2Ofb3vWKfGn+BLlx4
         Z8lXmlZ5JAxeaAUUuYgwTW1svAfTh58ln7aCRrflfm3TT74ygSdtJlgG1EO9TeeQZ+s8
         xJ5Ov0RQThfCeoXUkjvprzjPeBrnFaTkIvf70Gdyc/pKS0d1f0HfhAokrLxuf/QYJzXQ
         wN/NeehKgn8PkupqGyMGYhUnR8Tkn89ezcnQ+ss8FRbmhXXNBXV7H0qfVpmxhlOodAXt
         Jp0g==
X-Gm-Message-State: AFuF++kG0aFeSjjMd2QMonbnD96GgegGGHsBEi3VRQqpbhjU81j8GURZ
	5g6OwJ13hCuUtfQJsGkcTp7oOfBxJ6YuWi3Ia9TqFPleO+CED9+9+LHWxFSU8XQ=
X-Gm-Gg: AYBFou27k9yDwq0ysF8wOl/JDb+7SBjxVAplx50+GnqI/r8R0frboGEQWkYrUWMbKV5
	KoLdqwiousR16xiwRBVMz/fHGFwmiUZalGIGoPfc5wsxhewBZEg2IY0Ss1STvP5mfYJD4T4as74
	5VNnaQW42fMt9scbGYnpjENHOm4G4wfmJKtJ87NgSq4Gzx3I4hakgUks4cTcI84jx5OHjLP4zdg
	SCaUdXxe1lFj4yT1BGO0LBl322BIJtT6wR0iidmppFFE9jJXhG8cG8tDPEoALVXr82hQCRlLAbi
	cHBHP/1yEwMY6Gwz3O6gXDyEv8eEcOhAFQEGIzhvEhFKQpQ4AURsbJBMpRTSCG6tZWVljXOMDkM
	PZ3NqyjQ7qDilKbH3ZLkqBmAZ33QrvTQhxUHRd7Mal4ky+a0/f5zae1VBqctNB9smPX65/q0IRj
	nxjcT6XeSmwuIrQFBh1Y+srqJM8C9GYeOJOn5C26cBbg+LWCZzLCtvcKlwmUM5q/mvoZ1vQJW52
	a9MHcW3zHD1v4cSyU/CldlahBC/
X-Received: by 2002:a05:6402:2552:b0:6a7:ea54:378 with SMTP id 4fb4d7f45d1cf-6a7ea541ebbmr7455112a12.32.1788783262180;
        Mon, 07 Sep 2026 05:14:22 -0700 (PDT)
Received: from c13-yoga (85-195-250-62.ftth.glasoperator.nl. [62.250.195.85])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a7e66eb790sm4714443a12.3.2026.09.07.05.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 05:14:20 -0700 (PDT)
Sender: Yorick <yorickr96@gmail.com>
From: Yorick Rommers <yorick-rommers@hotmail.com>
To: linux-sound@vger.kernel.org
Cc: Vijendar.Mukunda@amd.com,
	venkataprasad.potturu@amd.com,
	broonie@kernel.org,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	cezary.rojewski@intel.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: amd: acp-da7219-max98357a: don't bind on Raven/Picasso boards
Date: Mon,  7 Sep 2026 14:12:28 +0200
Message-ID: <20260907121228.13754-1-yorick-rommers@hotmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The "AMDI5682" ACPI HID is matched by two AMD ASoC machine drivers:
cz-da7219-max98357a (this driver, Carrizo/Stoney) and
acp3x-alc5682-max98357 (Raven/Picasso). cz-da7219-max98357a is linked
first and probes the platform device first; its DAI links reference the
Stoney ACP, which is absent on Raven/Picasso, so its card can never be
instantiated there.

This was harmless until commit 42d99857d6f0 ("ASoC: core: Move all users
to deferrable card binding"): devm_snd_soc_register_card() now returns 0
for a card left pending instead of propagating -EPROBE_DEFER, so
cz_probe() succeeds and permanently binds AMDI5682. acp3x-alc5682-max98357
never binds and the internal speakers and headphone jack get no card.

Detect Raven/Picasso (and later) by the ACP3.x audio coprocessor's
dedicated PCI function (1022:15e2); Carrizo/Stoney reach the ACP through
the GPU driver and have no such device. Return -ENODEV so the driver core
continues probing AMDI5682 with acp3x-alc5682-max98357.

Fixes: 42d99857d6f0 ("ASoC: core: Move all users to deferrable card binding")
Cc: stable@vger.kernel.org
Signed-off-by: Yorick Rommers <yorick-rommers@hotmail.com>
Tested-by: Yorick Rommers <yorick-rommers@hotmail.com>
---
 sound/soc/amd/acp-da7219-max98357a.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

Tested on a Lenovo ThinkPad C13 Yoga (AMD Picasso, ACP3.x): with the patch the
card comes up under acp3x-alc5682-max98357 and audio works; without it
cz-da7219-max98357a binds AMDI5682 and no card is created.

diff --git a/sound/soc/amd/acp-da7219-max98357a.c b/sound/soc/amd/acp-da7219-max98357a.c
index af559653e625..1ac729a58bb4 100644
--- a/sound/soc/amd/acp-da7219-max98357a.c
+++ b/sound/soc/amd/acp-da7219-max98357a.c
@@ -17,6 +17,7 @@
 #include <linux/i2c.h>
 #include <linux/input.h>
 #include <linux/acpi.h>
+#include <linux/pci.h>
 
 #include "acp.h"
 #include "../codecs/da7219.h"
@@ -742,6 +743,18 @@ static const struct regulator_desc acp_da7219_desc = {
 	.n_voltages = 1,
 };
 
+/*
+ * The ACP3.x+ (Raven/Picasso and later) audio coprocessor is a dedicated PCI
+ * function.  Carrizo/Stoney - the only platforms handled by this driver - reach
+ * the ACP through the GPU driver and have no such device.
+ */
+#define ACP3X_PCI_DEV_ID	0x15e2
+
+static const struct pci_device_id acp3x_pci_ids[] = {
+	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, ACP3X_PCI_DEV_ID) },
+	{ 0, },
+};
+
 static int cz_probe(struct platform_device *pdev)
 {
 	int ret;
@@ -750,6 +763,16 @@ static int cz_probe(struct platform_device *pdev)
 	struct regulator_dev *rdev;
 	struct device *dev = &pdev->dev;
 
+	/*
+	 * AMDI5682 is also matched by acp3x-alc5682-max98357 (Raven/Picasso).
+	 * If the ACP3.x PCI function is present this is such a board; return
+	 * -ENODEV so that driver binds instead.
+	 */
+	if (pci_dev_present(acp3x_pci_ids)) {
+		dev_info(dev, "ACP3.x PCI device present, deferring to acp3x-alc5682-max98357\n");
+		return -ENODEV;
+	}
+
 	card = (struct snd_soc_card *)acp_soc_is_rltk_max(dev);
 	if (!card)
 		return -ENODEV;
-- 
2.55.0

