Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795420578;
	b=U/qRaiw3kpxv25/ddYdLKsxPNyKDUG/S5ih1XMqe/m9/Btdkh8APQ5vEw6+ttgCu5RZP
	 hcBGxWa9tddmZIiCiCmMMB/FFEukRSUWoxy4HoHHe5KQUK4+1z2bm9ZSz9OpoVlG6sEzL
	 X/XRYIyZfP6MWkZ1V5HSJXi00mMepMP5ivoQ6/kHCUM15TNmcaF1os6UiFEugQfnJEVTZ
	 SpoUTNt5U74gv+i3TSBbQy32iQBaTfEqmrj8/4gHkJxB2RzC6fRs6SYji0FgX4qmrcArf
	 8b4tohoO+0n3iI/aaAw7iaTMAN/T+0XRTfIN0PrYLjzI2avMZP1xF51XEuh0p2ofxBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795420578;
	h=Received:DKIM-Signature:From:To:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=tADQcUo/DGMQZ18TrP+iUmd0GoRg61Zw9BPIor0kAWw=;
	b=Xbe8glXTcuDqrriM29Dd09grbcPz3Qh9pGaOpG0retUhZrM+WjGkTVvx2fMsDdWACg/d
	 kfA8ylAofiG3yEQG6lj7AVdzjexpkqcuRwT8lWAUfgA7rJuxYhoLDEF9zWzjLvjvKFPdL
	 dKLvY2MiQlYDyUmogb41lOGHU9d5dnvChmVWIh8UV/t/QvUxTOaOlAI4+WkBU3GVqqC5Y
	 Rn11qPmWmogyRIxKildG2LeeEF9PMlXx64KoA/IykvR1Z+lKjy/bkey3Rd//dBXPddv5W
	 IQ31iiTNo+Kcu04eyEhztY2hjBos+/A9rv7rOUO5Xky9UQh81+LafTfMSDXK4XbDnqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GExjsBX+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE48606A31A;
	Mon, 23 Nov 2026 07:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GExjsBX+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AF481F000C4;
	Mon, 23 Nov 2026 07:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795420577;
	bh=tADQcUo/DGMQZ18TrP+iUmd0GoRg61Zw9BPIor0kAWw=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=GExjsBX+gfSCvRn7qXP4nlEFz0S2942TyDJuiT+qGzGEHnEWjVrLyAYOgExbHg6Sp
	 yttoP7CgzTRdUwAcp7PgPKs1XZInAmzYQpTjtV7/FdYyO3emnIxuwZwe4CWyOdQ2gt
	 kafPgSsYJTTf0gdyXELhPpHcUWRzkaT+qjZ24EdzpkaaOCuAJVpqf1qeG3AT2C+3kp
	 CEeuBCG+ZNWHOFFVH3JwPtQmJ8jpJ68rMMXz1TctNLIOpN11OOPJx/O2W49Es9ceOI
	 hMtv87tQ1YTjPOG5PalMrhen8A60HSPiceTwylf5+4ZHvjHuz/nnIRc+DaZMm6WnUk
	 BP7vArm8UByow==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Srinivas Kandagatla <srini@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 07/10] soundwire: qcom: Disable runtime PM and avoid clock underflow in qcom_swrm_remove()
Date: Mon, 23 Nov 2026 07:54:28 +0000
Message-ID: <20261123075522.405347-8-lee@kernel.org>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
In-Reply-To: <20261123075522.405347-1-lee@kernel.org>
References: <20261123075522.405347-1-lee@kernel.org>
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
qcom_swrm_remove() omits pm_runtime_disable() and unconditionally calls
clk_disable_unprepare(), triggering a clock enable count underflow and
leaving runtime PM enabled.

Resume the device before removing the bus master, disable runtime PM,
and only disable ctrl->hclk if the device is not runtime-suspended.

Closes: https://sashiko.dev/#/bug/linux-e26e04cd-3dec-4a3d-94e6-f45403c4bb57
Signed-off-by: Lee Jones <lee@kernel.org>
---

v2 => v3:
 - No changes

v1 => v2:
 - Drop Fixes and Stable tags

 drivers/soundwire/qcom.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 16ad86912e51..191f13a0bdc2 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -1788,8 +1788,13 @@ static void qcom_swrm_remove(struct platform_device *pdev)
 {
 	struct qcom_swrm_ctrl *ctrl = dev_get_drvdata(&pdev->dev);
 
+	pm_runtime_get_sync(&pdev->dev);
 	sdw_bus_master_delete(&ctrl->bus);
-	clk_disable_unprepare(ctrl->hclk);
+	pm_runtime_disable(&pdev->dev);
+	pm_runtime_put_noidle(&pdev->dev);
+	if (!pm_runtime_status_suspended(&pdev->dev))
+		clk_disable_unprepare(ctrl->hclk);
+	pm_runtime_set_suspended(&pdev->dev);
 }
 
 static int __maybe_unused swrm_runtime_resume(struct device *dev)
-- 
2.56.1.750.gf70dc682cf-goog

