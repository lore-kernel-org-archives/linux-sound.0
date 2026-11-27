Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795796652;
	b=HFm/5YNWW3sqoltGXueF9ctE4tA1SqVaNALjndfMkmOvWq9g6wute+rPUmln33wm08uz
	 tbuquFpWwuLcXwIXASEC4Vl6NqUD7+5/pBhqIuWiPfPV5U2LP7vwd8fcbvn3y7lKePBLU
	 N7f6TknkGDd19le5fvSNHkblqi2jb9NI9g+KGNyT4zxlP6fWwmk+BAzx4dFcu0p8oAGjU
	 A3eavPWXZ46O+qnbkm+WmGUq5WdF3c3OfC24NrlzPeK1AEVF2HCVlGMDgYrvp7qU3u/hO
	 Ew/IQc5Rq2RUnyV3yQ5LHf6eURox68UtqxDEMU9Ii3ia+bHGHSCWrAcf4kvXJHX3YmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795796652;
	h=Received:DKIM-Signature:From:To:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=KW8ORF0T5FYQ2DBXnDQNdG/w/vCponvgncwvYLP1DJ0=;
	b=4WG65qq38fZXqEeGb5+xoJM2EzXKrXsnugLNpuqlli51p6HYbbF0tKwijq6fwoC1YvRQ
	 xGGbzoHiemgMpai30JUGVZ7mBB48BOzX87LD/ME20UKL74GoxsWFXwoAaYL0NzE0rp8G/
	 JEiH3wlv2uZ4Fk8pIm66GRgkKDylGSfj72ONGcxAv9HwpP6VEmGbJ5/UWw7ORLipu4JGp
	 BNVkCZqIjD44CywdvO0DpwYsIxlsiWleUhFYhxsL2wG/7O/0h88WjtchVJoYJjgsYI6V5
	 XWjBjWSNpTo5ANDmtXmJRuqT6gWvPNdBuXKZwqYE7iQmn+RemeHgLcjqKaqbNZ2qeDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="XdeW/6ai";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D4C606A31E;
	Fri, 27 Nov 2026 16:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XdeW/6ai
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1A6E1F00893;
	Fri, 27 Nov 2026 16:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795796652;
	bh=KW8ORF0T5FYQ2DBXnDQNdG/w/vCponvgncwvYLP1DJ0=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=XdeW/6aix9/cXdNuAWwJbs3iJCuxLZMowTz1pSGGeSET0in9N4+8/LBDMzsQ0qm2y
	 5KlHsMdNyFoY4tdwYq+1auAA7jZsuLrbm1E8T/9XJr6sHxvEZVo4FjKU/nMfnOqmUK
	 3d2HSbaHf9XQlYY4A02pRPRb0a6dcbfQLszzYRvaXFg+kUCtX0FMyfJwsQ+e1xsMon
	 2OoZuULrkqfQuLODw5vYRpQOjmhOxLOmp3V8VkpallcEzDJgehCxY74OALYT/ZxtmA
	 RDr4Fk7eHz6/imSemGdQv5KRhB8QAkGvGiM/xbvEf4+5CmFzptuLPRMbdN5dBZc3A0
	 Gr5IMN57KwD1w==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Srinivas Kandagatla <srini@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/4] soundwire: qcom: Disable runtime PM and avoid clock underflow in qcom_swrm_remove()
Date: Fri, 27 Nov 2026 16:23:41 +0000
Message-ID: <20261127162402.3074271-2-lee@kernel.org>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
In-Reply-To: <20261127162402.3074271-1-lee@kernel.org>
References: <20261127162402.3074271-1-lee@kernel.org>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the controller is runtime-suspended, swrm_runtime_suspend() has
already disabled ctrl->hclk.  If the device is unbound in that state,
qcom_swrm_remove() omits pm_runtime_disable() on the primary and
standalone paths and unconditionally calls clk_disable_unprepare(),
triggering a clock enable count underflow and leaving runtime PM
enabled.

Resume the device before removing the bus master, disable runtime PM,
and only disable ctrl->hclk if the device is not runtime-suspended.

Closes: https://sashiko.dev/#/bug/linux-e26e04cd-3dec-4a3d-94e6-f45403c4bb57
Signed-off-by: Lee Jones <lee@kernel.org>
---
v3 => v4:
 - Rebase onto soundwire/next preserving the multi-master dependent remove path.

 drivers/soundwire/qcom.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 65add9a74ffd..336690217d68 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -2051,6 +2051,7 @@ static void qcom_swrm_remove(struct platform_device *pdev)
 		return;
 	}
 
+	pm_runtime_get_sync(&pdev->dev);
 	/* delete bus before dropping peer_ctrl; in-flight ops deref it */
 	sdw_bus_master_delete(&ctrl->bus);
 
@@ -2073,7 +2074,11 @@ static void qcom_swrm_remove(struct platform_device *pdev)
 		ctrl->peer_ctrl = NULL;
 	}
 
-	clk_disable_unprepare(ctrl->hclk);
+	pm_runtime_disable(&pdev->dev);
+	pm_runtime_put_noidle(&pdev->dev);
+	if (!pm_runtime_status_suspended(&pdev->dev))
+		clk_disable_unprepare(ctrl->hclk);
+	pm_runtime_set_suspended(&pdev->dev);
 }
 
 static int __maybe_unused swrm_runtime_resume(struct device *dev)
-- 
2.56.1.839.g22a8290db9-goog

