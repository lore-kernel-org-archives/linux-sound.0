Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B9E287503;
	Tue, 21 Apr 2026 20:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776801773; cv=none; b=AcapKHPQwYRSYEf6MzKtoGjlf6qAKPyK6QjXer3/2fcWbP1r0Qr3julztlCQI9yJn3aaUWAGeSzdakzGkqmVzIVgNNxqDEPjcsNXRNu16giWi+OTTbabtpcG/UJnmYUmo7LhzDVnfvLvboH7E4IngwnOcZGtXHbGE3yQMMGm2AI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776801773; c=relaxed/simple;
	bh=6ALuKLtdqBEX0l5wGdHl3Kb7SYykM07HbrkIYqS3aW4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=hMqoNMIntxaj1ycPxP32BZ6VGqTNx5LplpEDyevhNTbePi1/dc4hjaWm5y86cJX02Ofsn8TxxQrdERPxMaM5dqxcY+OSwPQJqHleOxBfAC6COLHrYmQ7Rjz1ydoG4DCIqBtEPjbxHF0amzdoiGWDZcTscx1icivBqxS0DlfAfNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bkLWTpx5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bkLWTpx5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECC2DC2BCB0;
	Tue, 21 Apr 2026 20:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776801773;
	bh=6ALuKLtdqBEX0l5wGdHl3Kb7SYykM07HbrkIYqS3aW4=;
	h=From:Date:Subject:To:Cc:From;
	b=bkLWTpx5u8v/8FnxpD+exJVYLOLtT53ZjxjQ+7INPtjKLdrn89Ec+r7QrlNOjDgtA
	 jZ13YbsSMrFm+X6R2MvjAoQkQQ0xXnDCv/R8u6sLIAPKIHEXivP6Bu9dO9DgVttBut
	 0bdITIIMao1FAur/FLc3GZ7Ssexrq073Lpv6FW5lNZat5cmZhExUgTscwJYI+YfRW5
	 TzEkjQGAFeumOGPHE9IJrAfMM9Ad2eNY2e2T1AS2mvypzGdY2x4TKeKXS2CCzsz8U/
	 i+4slO8l6svTOzvCvtTBrz17/V/fcTcGIvFjBABA//MjdCOAfJl/K3iou7BTbGm4ZV
	 8lK4MdbbX+/fw==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 21 Apr 2026 21:02:00 +0100
Subject: [PATCH] ASoC: ops: Log unknown controls in snd_soc_limit_volume()
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260421-asoc-limit-volume-error-v1-1-dcd0102576a6@kernel.org>
X-B4-Tracking: v=1; b=H4sIALfX52kC/yXMQQqDQAxA0atI1gacobSjVyldjDG2KeqURKUg3
 r1jXb7F/xsYq7BBU2ygvIpJmjJcWQC94vRklC4bfOWv1cU7jJYIBxllxjUNy8jIqkmRog8uhI5
 uVEOuP8q9fP/n++O0Le2baT52sO8/l7DMiXsAAAA=
X-Change-ID: 20260421-asoc-limit-volume-error-ca28188dc7c9
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: Tobias Heider <tobias.heider@canonical.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1135; i=broonie@kernel.org;
 h=from:subject:message-id; bh=6ALuKLtdqBEX0l5wGdHl3Kb7SYykM07HbrkIYqS3aW4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp59fqHvE8F8yA+YRM3IRDjq7r6yL7Ckzb6rZl2
 epmiVqzAPmJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaefX6gAKCRAk1otyXVSH
 0F6iB/9fdeNs25I5kvRYAwdaf8D51Xd1Qh4Tml4JtW5p38T9VkhKAXliKO+ayAS6ew+HFISM8qO
 Q0IQWBDjLgedWR3WyWO7I7RIjmsmW1GocngOKuP9ew5EYNtm/0ECQUGMNGNa59j8FvoCyar1vYe
 et9mZmrgM8yEnI78vRZsD5xD6IcvWkaaZbUUdwdfqY95n3P0NbJ3/CoX2Y0rXKKn3VJEpGAqFxD
 Vw4I80+SIh4asULAo5cGCEGKLfa++Phb7ml/0aNsG0xELet1i6w0RoxZI79Qkv7bIAToslJGLeY
 NBwZYpXlaFNhSjWU3SICKVEqehE07KBgQZDDOqiAmiu08jqA
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
 sound/soc/soc-ops.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
index f966d4e13c7f..94e28fc780a5 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -503,6 +503,9 @@ int snd_soc_limit_volume(struct snd_soc_card *card, const char *name, int max)
 			mc->platform_max = max;
 			ret = snd_soc_clip_to_platform_max(kctl);
 		}
+	} else {
+		dev_warn(card->dev, "Volume limit for unknown control '%s'\n",
+			 name);
 	}
 
 	return ret;

---
base-commit: 028ef9c96e96197026887c0f092424679298aae8
change-id: 20260421-asoc-limit-volume-error-ca28188dc7c9

Best regards,
--  
Mark Brown <broonie@kernel.org>

