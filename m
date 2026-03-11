Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FEC22DC321;
	Wed, 11 Mar 2026 04:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773204192; cv=none; b=qzb+MPWGRG+yLf5/EZn3ouaiplJZ8Cw9tU5G4xEQh5+HdsaX6NDR9c1QStKSBc3gcM0tTIBtEshTccAzaluX1N2n2sqwRYiVaNX+ZGWFPjf4X3zpJ2bU2llucOfTvzyGDHbm3SD8bjgRfLsOw8eCvOe+jDHArwl6gqD2P2k7gH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773204192; c=relaxed/simple;
	bh=66W1pmkks2I4ITe9DRIevRnJ2zaQ2m9va/55lmzkK3A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NpWI6874qBul2MoxRGDmHUvbLM3g2oCmJVJFd8k45buhYHJrGKWX+qOPpE2CGqKxRd+3f9FI/Cz28RKNlDehUds3xUK54eP8Q07xohWnmP5FW0Cl8Onugn8DYRCt9z285ltgY8pQxm7PR6pSIWpDXA+kRrA3vZeyRbWjbHCn5NA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HKa0NFrC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HKa0NFrC"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A4D22C4CEF7;
	Wed, 11 Mar 2026 04:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773204191;
	bh=66W1pmkks2I4ITe9DRIevRnJ2zaQ2m9va/55lmzkK3A=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=HKa0NFrCiKP5Z7bnhBhX1hgGthEM5VKasMLgIzvW39+Arkcu3nWHTW7I2nQ1Iz3Qw
	 9jt/f39ho6jMTLnLBYwW3PuUQnqawcicC21+PteDw6nLPAy9zqoEE5ZyHT+BHEnvvO
	 FSjhtNOmqr2fAt/pdZeG40odUID1nW1vyelLJVMvOE0rJN2sTL2TrenyWJjirROI8A
	 KzHCXuyMaqQssHoVsvJ774UMJuzRRwb8c7K6GGvG5Ffb76rBUezJZDMnV+OPduTof/
	 JQS6B08uR5F//nyaJT6fmzirAUObqM5lblKYmPM/EwKEZ/kX1AP4IsRa/nryoZLUqB
	 sWhX0J5CdHN+A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9278CFD88F7;
	Wed, 11 Mar 2026 04:43:11 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Subject: [PATCH 0/2] ASoC: codecs: aw88166: Support device specific
 firmware
Date: Tue, 10 Mar 2026 23:43:03 -0500
Message-Id: <20260310-aw88166-fw-v1-0-2777563bb673@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDY0MD3cRyCwtDMzPdtHJdSwPjpDQz81QDMyNDJaCGgqLUtMwKsGHRsbW
 1AO0TzHxcAAAA
X-Change-ID: 20260310-aw88166-fw-903bf67e0621
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Weidong Wang <wangweidong.a@awinic.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>, 
 Teguh Sobirin <teguh@sobir.in>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773204187; l=960;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=66W1pmkks2I4ITe9DRIevRnJ2zaQ2m9va/55lmzkK3A=;
 b=Q3RAq01dTOkd5P5WbTiga073JhNgG8Jv/3E4ceB/FwiBZKCMwFDA/qdVqU6+plRirM8MzidU7
 v+p71E+Ajz/AhcJzlHZYMLwyLBRXSayT5JZRhoS8s1ECglFvgIrb2EL
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

The driver currently loads a hardcoded firmware path. This adds support
for reading a device specific path from the kernel device tree.

Patch 2 was originally part of a larger change [0] by Teguh Sobirin and
was cut down to only the device specific firmware part.

[0] https://github.com/AYNTechnologies/linux/commit/9dbdd074423d970a9dec9a60f8bb99f8cfafd6a1

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
Aaron Kling (1):
      ASoC: dt-bindings: Document firmware-name for awinic,aw88166

Teguh Sobirin (1):
      ASoC: codecs: aw88166: Support device specific firmware

 .../devicetree/bindings/sound/awinic,aw88395.yaml     |  3 +++
 sound/soc/codecs/aw88166.c                            | 19 +++++++++++++++----
 2 files changed, 18 insertions(+), 4 deletions(-)
---
base-commit: fe9e3edb6a215515d1148d32a5c445c5bdd7916f
change-id: 20260310-aw88166-fw-903bf67e0621

Best regards,
-- 
Aaron Kling <webgeek1234@gmail.com>


