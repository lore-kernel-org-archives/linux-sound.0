Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E2E280CE5;
	Wed, 22 Apr 2026 20:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776890683; cv=none; b=pPO5AiEpeRa5tepPymgW57bwzthGiVxbBy8ePHZGDwQL7sHgMDAPY4KgVjMJaAZI0VoyZdkq8L0oniaO2EL98gxsTinvNzUWcMnq4mO9qYr9DpRQe2oReJRTs6/vS855X6tCRMBiIjHWPFhXa6pSYaausK+t6Rph8+LNfgFFE4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776890683; c=relaxed/simple;
	bh=BjVfRVofK9IziQLalWuNm4cvbaaSjx0ivggHdlQFvs8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=GxDe7PdWzM6n18FognLMwcAYjMAmry+UNpAw4K1fWEJJ0aTMIfRYZQ2NQQvssJp6XTDcDv7E8zsOaYEHFOCveb6XjXTSU/4LGtupCjdwqDCJ0f4zLhyi8xGPFEyZOet7wttAlNDSadDbANDhmnqaRQE3IGqfaQuXQwWgYE9YQ/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gQ9OckYU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gQ9OckYU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AF2AC19425;
	Wed, 22 Apr 2026 20:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776890683;
	bh=BjVfRVofK9IziQLalWuNm4cvbaaSjx0ivggHdlQFvs8=;
	h=From:Date:Subject:To:Cc:From;
	b=gQ9OckYUI3N6rfDGcrRKN2U7E7vSBEnxdAq+rLMDYRoksOAzJV3Xhn9+oYPM02ho/
	 HeOtpVkEQ0rkGydK6TZfYrl3ZU6O15v+rvI88CPbyn/YKRgHJQKM92dyeyDoycsJq2
	 EFjjL8sUa6UhsGt0F4XVcSru4jK3CkapxhdMGcxcBM/Fr6/2oIufcGCIUdgefG7da1
	 4yH38H62E7Z+mI4NLkWALI83hWLHO60GL+iW5c3yBWtdYD0geXzNoMPZG6KSG46SRx
	 acbgSi9ZxktwvZIB9pHBChEkSkhf+X6bk6mU2EGpAZyk6Km48VAe0vDRzTZtsB5juq
	 zWn85rAmpw04g==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 22 Apr 2026 21:34:05 +0100
Subject: [PATCH v2] ASoC: ops: Log unknown controls in
 snd_soc_limit_volume()
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260422-asoc-limit-volume-error-v2-1-2e2ced321229@kernel.org>
X-B4-Tracking: v=1; b=H4sIALww6WkC/4WNQQ6CMBBFr0Jm7Zi2UUBX3sOwqO0Io0DNFBoN4
 e4CHsDlS95/f4JIwhThnE0glDhy6BcwuwxcY/uakP3CYJTJ1cFotDE4bLnjAVNox46QRIKgs6b
 UZeld4U6wrF9Cd35v5Wv14zjeHuSGNbcaDcchyGe7Tnr1/r8kjRq980orcyxym1+eJD21+yA1V
 PM8fwGdmkZx0QAAAA==
X-Change-ID: 20260421-asoc-limit-volume-error-ca28188dc7c9
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: Tobias Heider <tobias.heider@canonical.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1454; i=broonie@kernel.org;
 h=from:subject:message-id; bh=BjVfRVofK9IziQLalWuNm4cvbaaSjx0ivggHdlQFvs8=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp6TM4foEDiSgI6ZqT5L/3XXQkefnWVhad81Cve
 Llc19X2LqCJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaekzOAAKCRAk1otyXVSH
 0GKUB/47JMACcH5bSlkq2nGianb1bCE9lxKf1qNcSqpqiXtoAv06/kQJEZzH2kDnEMvEKHlVtez
 sOf60SPgitoT69taAtRh0Ctt+4PD40JuSk8IrPlnGE/kEhfv7xdj/4bLol5IH01dkRXr7wecUOH
 QEOgA1uKRMb1wftAZ1DQ3JPndVnjDq4bJqxTqMxpNu2BHUQfymNRDloJUn0XP262Qhb6LimxaeA
 DgRLbvD3e4QEzTG854qYUJpnZS8rDDZBwbEKcK9VL/RAeslqU/HSYqQYes9MDWSFi11rPMjcSzM
 ohpAyzMIZ6Aw8l+SZMnhQhvpkbjdP4raWfFD5E8ZKL+q3DJQ
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

When we fail to look up the control name in snd_soc_limit_volume() we don't
log anything, the error code isn't particularly descriptive and checking
the return value of the function at all is a bit erratic among the callers.
Since there is no reason why anyone should ever be attempting to limit the
volume of a nonexistant control add a log message in the core to improve
usability.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
Changes in v2:
- Lower the print to a dev_dbg() since some cards do blindly add limits
  for multiple variants they handle so would see warnings.
- Link to v1: https://patch.msgid.link/20260421-asoc-limit-volume-error-v1-1-dcd0102576a6@kernel.org
---
 sound/soc/soc-ops.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
index f966d4e13c7f..1fc87cd5ea2f 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -503,6 +503,10 @@ int snd_soc_limit_volume(struct snd_soc_card *card, const char *name, int max)
 			mc->platform_max = max;
 			ret = snd_soc_clip_to_platform_max(kctl);
 		}
+	} else {
+		/* Some cards blindly add limits for multiple variants. */
+		dev_dbg(card->dev, "Volume limit for unknown control '%s'\n",
+			name);
 	}
 
 	return ret;

---
base-commit: 028ef9c96e96197026887c0f092424679298aae8
change-id: 20260421-asoc-limit-volume-error-ca28188dc7c9

Best regards,
--  
Mark Brown <broonie@kernel.org>

