Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795420565;
	b=T4WuLlvzKxbyBbtulQsiDx++gZ7P63EsqFJ4n5ypg7oEVD6+JrYz1rA0sS496vKs3Ien
	 J3755JEhqRtYBl1RYtXok1mfy54pwPtmGSPqKiRHVeacr//081eQCl2SMqS15N6/UNe/2
	 2vGcni28qJdfdYyhiuNWJq1fWuOEqU5oqpvLJsbRk30IXXJ2qufmJym95x4/C3kElRX0Y
	 HHNHxNAjKdTO3dPVy9MU8nr+wMM+0nnHOFWWALew3athCveLxGmn8W38FRqtbLEk23Sqh
	 dZDseDwgTcnT4BBFyB3Qz2+xXJNoRvyDQ1JlsDCrWqKzGF6N0JM1+7JJHhPlo7yairg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795420565;
	h=Received:DKIM-Signature:From:To:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=vSa7V0w03YeIxuDl0FkbVYGdaVLs+QISsPdU2Ujwh88=;
	b=xhDQEYKCD8qjdhS4kytlwLtvwagwDp1Uel4Y0SMKhgSgBgQDDU+tY76YBSrhc5whW1nI
	 DI5kvf3eAIf3ZpBE4KYV2n4Bq0bqcTRoeJx08kcA4xAVzb1ufGDrtTOSuswMFL9BzjKNZ
	 MqnRC+CnLFPmK4eBurjxa3JvAqx0V6G23qhj12BA7yxCZoZlXL0JqTZJXvUom48EPr5No
	 G8XyxLA1emBxIrwdTXL4Bv8MgE7G+xb0jZZDtrE/hCc+omZy5pKKv0dZkLcKxzzACUt6g
	 e4y/dHR92mlCUIV/IhQVVlGrrKREWjHRyqcnz94iGSkw3MdSitNOtFwhgUiRPMGm/yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hjYKmMN2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42AB8606A31A;
	Mon, 23 Nov 2026 07:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hjYKmMN2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4D8E1F000C4;
	Mon, 23 Nov 2026 07:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795420564;
	bh=vSa7V0w03YeIxuDl0FkbVYGdaVLs+QISsPdU2Ujwh88=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=hjYKmMN2YpeP3RPgh9cHokfhAz8Tl048W8LpOydcioZsXmL7LUpSEfWjEeDmsD8Eb
	 X9EKuEIGdzfvQ12Xxl3Gg5twer9HQtPvZUUDSa/r8uzwmxcMDpEmBAIWjnrOQrh1WD
	 tdODhMyPAtSTjg5wDzP4OhOpUl/mdomwHIFLbj8AeocM/wSW4kwrWTPXayZ1Pd0pAc
	 Z13sVdZwOyGgyvv9xyEkfYjENpu8kR1TcXeRsFmrcj4gM5o3U8ST+tLHKf20VqCg9b
	 XVhRV7H8pRwGkJt5xgZpib+EyZ/NVBaf7YoC+K8sTGeOikZxXQ2gDVZvHgqSpNrlTh
	 CbC4VmKPpi4cQ==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 05/10] soundwire: intel_ace2x: Protect bus.bpt_stream with bus_lock
Date: Mon, 23 Nov 2026 07:54:26 +0000
Message-ID: <20261123075522.405347-6-lee@kernel.org>
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

intel_ace2x_bpt_open_stream() checks and assigns cdns->bus.bpt_stream
without holding cdns->bus.bus_lock.  Concurrent BPT open requests can
both observe a NULL cdns->bus.bpt_stream pointer, allocate separate
streams, and overwrite cdns->bus.bpt_stream, leaking the first stream.
In addition, failures after sdw_slave_bpt_stream_add() jump past
sdw_stream_remove_master(), leaving the master runtime allocated by
sdw_stream_add_slave() on the bus list.

Hold cdns->bus.bus_lock when checking, assigning, and clearing
cdns->bus.bpt_stream, and remove both slave and master stream runtimes
on open failure.

Closes: https://sashiko.dev/#/bug/linux-88535ed9-b7e9-4ede-93c7-59950c524c0b
Signed-off-by: Lee Jones <lee@kernel.org>
---

v2 => v3:
 - Rebase onto soundwire/next

v1 => v2:
 - Drop Fixes and Stable tags

 drivers/soundwire/intel_ace2x.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/soundwire/intel_ace2x.c b/drivers/soundwire/intel_ace2x.c
index 642b33ab5526..c964dd4a7c22 100644
--- a/drivers/soundwire/intel_ace2x.c
+++ b/drivers/soundwire/intel_ace2x.c
@@ -83,16 +83,21 @@ static int intel_ace2x_bpt_open_stream(struct sdw_intel *sdw, struct sdw_slave *
 	int len;
 	int i;
 
+	mutex_lock(&cdns->bus.bus_lock);
 	if (cdns->bus.bpt_stream) {
+		mutex_unlock(&cdns->bus.bus_lock);
 		dev_err(cdns->dev, "%s: BPT stream already exists\n", __func__);
 		return -EAGAIN;
 	}
 
 	stream = sdw_alloc_stream("BPT", SDW_STREAM_BPT);
-	if (!stream)
+	if (!stream) {
+		mutex_unlock(&cdns->bus.bus_lock);
 		return -ENOMEM;
+	}
 
 	cdns->bus.bpt_stream = stream;
+	mutex_unlock(&cdns->bus.bus_lock);
 
 	ret = sdw_slave_bpt_stream_add(slave, stream);
 	if (ret < 0)
@@ -105,7 +110,7 @@ static int intel_ace2x_bpt_open_stream(struct sdw_intel *sdw, struct sdw_slave *
 	if (!pdi0) {
 		dev_err(cdns->dev, "%s: sdw_cdns_alloc_pdi0 failed\n", __func__);
 		ret = -EINVAL;
-		goto remove_slave;
+		goto remove_master;
 	}
 
 	sdw_cdns_config_stream(cdns, 1, dir, pdi0);
@@ -117,7 +122,7 @@ static int intel_ace2x_bpt_open_stream(struct sdw_intel *sdw, struct sdw_slave *
 	if (!pdi1) {
 		dev_err(cdns->dev, "%s: sdw_cdns_alloc_pdi1 failed\n", __func__);
 		ret = -EINVAL;
-		goto remove_slave;
+		goto remove_master;
 	}
 
 	sdw_cdns_config_stream(cdns, 1, dir, pdi1);
@@ -136,7 +141,7 @@ static int intel_ace2x_bpt_open_stream(struct sdw_intel *sdw, struct sdw_slave *
 	pconfig = kzalloc_objs(*pconfig, 2);
 	if (!pconfig) {
 		ret =  -ENOMEM;
-		goto remove_slave;
+		goto remove_master;
 	}
 
 	for (i = 0; i < 2 /* num_pdi */; i++) {
@@ -149,7 +154,7 @@ static int intel_ace2x_bpt_open_stream(struct sdw_intel *sdw, struct sdw_slave *
 
 	if (ret < 0) {
 		dev_err(cdns->dev, "add master to stream failed:%d\n", ret);
-		goto remove_slave;
+		goto remove_master;
 	}
 
 	ret = sdw_prepare_stream(cdns->bus.bpt_stream);
@@ -293,15 +298,16 @@ static int intel_ace2x_bpt_open_stream(struct sdw_intel *sdw, struct sdw_slave *
 		dev_err(cdns->dev, "%s: remove master failed: %d\n",
 			__func__, ret1);
 
-remove_slave:
 	ret1 = sdw_stream_remove_slave(slave, cdns->bus.bpt_stream);
 	if (ret1 < 0)
 		dev_err(cdns->dev, "%s: remove slave failed: %d\n",
 			__func__, ret1);
 
 release_stream:
+	mutex_lock(&cdns->bus.bus_lock);
 	sdw_release_stream(cdns->bus.bpt_stream);
 	cdns->bus.bpt_stream = NULL;
+	mutex_unlock(&cdns->bus.bus_lock);
 
 	return ret;
 }
@@ -335,8 +341,10 @@ static void intel_ace2x_bpt_close_stream(struct sdw_intel *sdw, struct sdw_slave
 		dev_err(cdns->dev, "%s: remove slave failed: %d\n",
 			__func__, ret);
 
+	mutex_lock(&cdns->bus.bus_lock);
 	sdw_release_stream(cdns->bus.bpt_stream);
 	cdns->bus.bpt_stream = NULL;
+	mutex_unlock(&cdns->bus.bus_lock);
 }
 
 #define INTEL_BPT_MSG_BYTE_MIN 16
-- 
2.56.1.750.gf70dc682cf-goog

