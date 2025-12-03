Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B85C2DE70E;
	Wed,  3 Dec 2025 10:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764759446; cv=none; b=aFvaujg17R1/lUW+BxZxiEcjqw/x2xcToE65oOShicYyNqGgf5D1J0AE/jROIOZ/YdtrtHWmTUeTMwyLybzG3kPM/t0N5mJquNnIIU67bgbuVBLYE3ynLxOGNpa3Rz7RKCAeWZAj1klsSVh0O2yazMppULg3p2HtwO+eDfIpUNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764759446; c=relaxed/simple;
	bh=y7vUqJ3Q6UliL9svHbGaSwMBso9GRCeYl2zuGfN9TW8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YfhkfOo3UACJ0YUyDrjyKAT2V7RU4bIssjY6FkHp7TzGasPw+mtKPnYoRkCXu2TSzuJqweZwskujWs6mmxZrJINVVyigvmlJELbmnznN5urGg/6rCkEjlPO2UNrcONIqzs0pezXZpW1VLO0VH5qxakDU5KQ4dUgGq6w60VDyGTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ihHZsxJN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ihHZsxJN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4A1EC19421;
	Wed,  3 Dec 2025 10:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764759445;
	bh=y7vUqJ3Q6UliL9svHbGaSwMBso9GRCeYl2zuGfN9TW8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ihHZsxJN0V7O1ayV5tIrZCg0uxlqQEl61DzzplSO8zGBK9imRsU+wPX84AhJQfsKV
	 udUvgqBwvFtzNQKgAziEYJmx+Q7H7RTWANrgjiCZQtZjzr2XRR1DkuAV71DzgrF8x/
	 Linn/Pn1RQ0fW76n/C3IAAaQZfjhwolPK+WaUp3/1GvRvGDT06RKAylIY2Gm7e8Lnl
	 F1LnzeVppoolx8PPtmBiJy35FdRGwFb+z8ul/d2NOWrUklQ5JrKwpN61LrinGawuAV
	 i+iFWq9A4lW1jvK0jlNTE3tjY+xB+pMyrXSOeohc+koJAveyGVtNGOuQUQ7Cf4sm3X
	 Ie4tkGvKCrFOQ==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vQkY9-000000006UY-3EI1;
	Wed, 03 Dec 2025 11:57:33 +0100
From: Johan Hovold <johan@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH 2/2] ASoc: qcom: q6afe: use guards consistently
Date: Wed,  3 Dec 2025 11:55:42 +0100
Message-ID: <20251203105542.24765-3-johan@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251203105542.24765-1-johan@kernel.org>
References: <20251203105542.24765-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A recent change switched to using guards for the port list lock but only
modified two out of three functions where the lock is held.

Convert also the third function for consistency while switching to a
scoped guard in q6afe_port_get_from_id() for clarity.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 sound/soc/qcom/qdsp6/q6afe.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6afe.c b/sound/soc/qcom/qdsp6/q6afe.c
index 0b01fc9e13a7..d8173cd9e60a 100644
--- a/sound/soc/qcom/qdsp6/q6afe.c
+++ b/sound/soc/qcom/qdsp6/q6afe.c
@@ -931,13 +931,11 @@ static void q6afe_port_free(struct kref *ref)
 {
 	struct q6afe_port *port;
 	struct q6afe *afe;
-	unsigned long flags;
 
 	port = container_of(ref, struct q6afe_port, refcount);
 	afe = port->afe;
-	spin_lock_irqsave(&afe->port_list_lock, flags);
-	list_del(&port->node);
-	spin_unlock_irqrestore(&afe->port_list_lock, flags);
+	scoped_guard(spinlock_irqsave, &afe->port_list_lock)
+		list_del(&port->node);
 	kfree(port->scfg);
 	kfree(port);
 }
@@ -1807,8 +1805,8 @@ struct q6afe_port *q6afe_port_get_from_id(struct device *dev, int id)
 	port->cfg_type = cfg_type;
 	kref_init(&port->refcount);
 
-	guard(spinlock_irqsave)(&afe->port_list_lock);
-	list_add_tail(&port->node, &afe->port_list);
+	scoped_guard(spinlock_irqsave, &afe->port_list_lock)
+		list_add_tail(&port->node, &afe->port_list);
 
 	return port;
 
-- 
2.51.2

