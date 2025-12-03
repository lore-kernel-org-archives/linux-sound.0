Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B7D72DE707;
	Wed,  3 Dec 2025 10:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764759446; cv=none; b=h9o8FTFwDue3XX2a9TbMWdOkhlxaEqIwGOmRWrkzHl9C864XCtCS68dRkA7qCY75ZVZQN7XqBKUUQNqGAJPd15/KRIF/8AZmWqh7Dm/0x7H4xgvzUWKesZn/v96Z3ciyIgT3PYYzhNKv1m29uEHrh0qTCiAsLqK1NI3c2ZMcI8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764759446; c=relaxed/simple;
	bh=zPeu4HgQNk9WYrgmIq8It0U7Hp9YmciMnoo6Kd1ObVs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AZNVLaPzDU0BW/1IFxyGsBTkhyHvpkMwINIhIHxLfq418e6/0vGHu+HW7KD8ysVITy/lHsRkKsZVeax2jMXou3pcs99nRjJLs789jYzYdgl0QIM/9a/4dOsvz4HZj0Q5DBe1qCMirbm9L4fSQ01YVhLDvwKOzmpZ8vDqF9+1Dw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Iy5b9a5E; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Iy5b9a5E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCE2BC4CEFB;
	Wed,  3 Dec 2025 10:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764759445;
	bh=zPeu4HgQNk9WYrgmIq8It0U7Hp9YmciMnoo6Kd1ObVs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Iy5b9a5EFiIBiJCxRsz+PFn9agcbAHdCHwI8iMkICwYMEhRUXdVivM3jJHHsuUWhT
	 eI8sI+r277Yp9Pi6C43M+T/WzdMSW/Gb6yB45GFiOuOZz6J3je6GHlnKPK3FvGCLTD
	 xj7fLKR7LF6E4zRvdIScbUpJv8IFy6qcPYKEVlo/GEXv+xp0otRrAtcFkzYCJPQ1lg
	 fuM9H6sD4ugBxspOaU/OAFpPBpOZiGJKPxgmZWmWE9zDuexZnUUTQUpmm8jsu5mXop
	 zaB1kQWfLAp8kAH1v4OIL3qtkUhGA53VnqefA139e985Kzz/Gxg2b3jyupJyGLWMkF
	 Le2efAX9hFitA==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vQkY9-000000006UW-2txW;
	Wed, 03 Dec 2025 11:57:33 +0100
From: Johan Hovold <johan@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 1/2] ASoc: qcom: q6afe: fix bad guard conversion
Date: Wed,  3 Dec 2025 11:55:41 +0100
Message-ID: <20251203105542.24765-2-johan@kernel.org>
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

A recent spinlock guard conversion used the wrong guard so that
interrupts are no longer disabled while holding the port list lock.

Based on a cursory look this appears to be safe currently, but it could
cause a deadlock if one of these helpers are ever called in interrupt
context.

Fixes: 4b1edbb028fb ("ASoC: qcom: q6afe: Use guard() for spin locks")
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 sound/soc/qcom/qdsp6/q6afe.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6afe.c b/sound/soc/qcom/qdsp6/q6afe.c
index 980851a12976..0b01fc9e13a7 100644
--- a/sound/soc/qcom/qdsp6/q6afe.c
+++ b/sound/soc/qcom/qdsp6/q6afe.c
@@ -947,7 +947,7 @@ static struct q6afe_port *q6afe_find_port(struct q6afe *afe, int token)
 	struct q6afe_port *p;
 	struct q6afe_port *ret = NULL;
 
-	guard(spinlock)(&afe->port_list_lock);
+	guard(spinlock_irqsave)(&afe->port_list_lock);
 	list_for_each_entry(p, &afe->port_list, node)
 		if (p->token == token) {
 			ret = p;
@@ -1807,7 +1807,7 @@ struct q6afe_port *q6afe_port_get_from_id(struct device *dev, int id)
 	port->cfg_type = cfg_type;
 	kref_init(&port->refcount);
 
-	guard(spinlock)(&afe->port_list_lock);
+	guard(spinlock_irqsave)(&afe->port_list_lock);
 	list_add_tail(&port->node, &afe->port_list);
 
 	return port;
-- 
2.51.2

