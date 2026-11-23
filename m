Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795420559;
	b=oeSaciIyOSjEMID/6qmX0WXxnl5sGf24KvSoZH63CI3OnNhEYMiuB672Ylqh5QuibU8F
	 dqVa6JY/pVTM3dcZBfInu04bXhQsoigrEHocyhjcELRNzgns8IKG8TS1NDrYFoXuDZ1bK
	 rpnOYYzwZZzImbr7lTYSWnY2h/G4Hq3Ce5jbju8Wv3ysK1mTAaypxW3nQR76QdFxoJqm/
	 agv//iQpZcTGz3A7IrnEGiMQxnWy7WE/DxNZbblQwVDX7tsx2AeG2cMefn2af4FsV0s7a
	 XjJozOi14IO7VFcbZFeATqiHmVbEVG84QoVIs4HRi6pzQ9TwcF8sk3X8N3DTdPYulCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795420559;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=sgID8Z34ngxFIBd0G31JYmzKeJHHjPNYnNviDdDqTO8=;
	b=C5g0CdESiF2IdkXH9NCpaae5pgeHnv+/3FyPYNqikQz0IUQfhnDt8V+dVY/CfhBvc1B3
	 xjBGyfSKCf0pGiUe76U49jkREZs2ZnVskL5KtWnsjC5p0NNsxzJgeWyy71Dunf9/xOZ5i
	 ne0deH0FshIrPzrX7Qrx5xk/YlcUG4K7EW+vj+r3gugdWKgU+hjyU1TK6dlcyhSk0pQi0
	 3ap32WFUgUStcf1g32DL38TIgSgOCgtSKcw04StfvJbVJTY6RFB6EfXHPWeN+pHsrQwnB
	 8fs00ZwQkOcUuqWZUfP9qMFS2ellSAEHvuGddOPVklmvM/t6U/Rrjk4FAps+DxaMCSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="aVxGm/IN";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F8B606A31F;
	Mon, 23 Nov 2026 07:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aVxGm/IN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEFF81F000EF;
	Mon, 23 Nov 2026 07:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795420558;
	bh=sgID8Z34ngxFIBd0G31JYmzKeJHHjPNYnNviDdDqTO8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=aVxGm/INXYMwKgPvInKzndhl2VswFAjQrMsCSixm05p4qy8TUGpbvw8J2F/eoc7Mn
	 sqjxHbNop8igSRz5zzUV1jndWrTdNx+3E1WGe2MHmG9PnWC3uA6zE6GNGnDMm500Qa
	 cEqheASqukSLxA3u/F7NnaeUt4D4qlCbwAScem2oeF3Wr7/Do/GtCyMvRZHu6GcIsg
	 8CkiMgtHBPMNuESg7bs1HgJAqkOtu5thxqj9th1ItIjH+vteW7HUbEwhtZT8REiNK6
	 aLts7KN+6tT32ChpZi546Cde3qK37/7FBqYSLr3FvV6nFbOqRxsE6CnQUledeegUXl
	 yVFkZy8esdIQQ==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH v3 04/10] soundwire: stream: Clean up allocated runtime resources on config failure
Date: Mon, 23 Nov 2026 07:54:25 +0000
Message-ID: <20261123075522.405347-5-lee@kernel.org>
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

In sdw_stream_add_master() and sdw_stream_add_slave(), failures during
runtime or port configuration jump directly to the unlock label,
bypassing alloc_error and leaving newly allocated master/slave runtime
and port structures attached to the stream and bus lists.

Validate port and stream parameters before mutating runtime or stream
state, track whether ports were newly allocated in the current
invocation, and route configuration failures through alloc_error so all
resources allocated by the failing call are released without leaving
pre-existing state modified.

Closes: https://sashiko.dev/#/bug/linux-546e137d-6e4d-4f22-99c3-8ccc8beb5350
Signed-off-by: Lee Jones <lee@kernel.org>
---

Cc: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: HyeongJun An <sammiee5311@gmail.com>

v2 => v3:
 - Validate slave port configuration and stream parameters before
   mutating runtime or stream state
 - Drop v2 Reviewed-by and Tested-by tags due to configuration ordering
   changes

v1 => v2:
 - Only increment stream->m_rt_count in sdw_stream_add_master() when
   sdw_master_port_allocated(m_rt) is true
 - Drop Fixes and Stable tags

 drivers/soundwire/stream.c | 88 +++++++++++++++++++++++++++-----------
 1 file changed, 62 insertions(+), 26 deletions(-)

diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index 573ca35b0e8b..eccb279ea662 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -1026,14 +1026,18 @@ static int sdw_slave_port_alloc(struct sdw_slave *slave,
 				struct sdw_slave_runtime *s_rt,
 				unsigned int num_config)
 {
-	struct sdw_port_runtime *p_rt;
+	struct sdw_port_runtime *p_rt, *_p_rt;
 	int i;
 
 	/* Iterate for number of ports to perform initialization */
 	for (i = 0; i < num_config; i++) {
 		p_rt = sdw_port_alloc(&s_rt->port_list);
-		if (!p_rt)
+		if (!p_rt) {
+			list_for_each_entry_safe(p_rt, _p_rt,
+						 &s_rt->port_list, port_node)
+				sdw_port_free(p_rt);
 			return -ENOMEM;
+		}
 	}
 
 	return 0;
@@ -1049,16 +1053,16 @@ static int sdw_slave_port_is_valid_range(struct device *dev, int num)
 	return 0;
 }
 
-static int sdw_slave_port_config(struct sdw_slave *slave,
-				 struct sdw_slave_runtime *s_rt,
-				 const struct sdw_port_config *port_config,
-				 bool is_bpt_stream)
+static int sdw_slave_port_config_valid(struct sdw_slave *slave,
+				       struct sdw_slave_runtime *s_rt,
+				       const struct sdw_stream_config *stream_config,
+				       const struct sdw_port_config *port_config)
 {
+	bool is_bpt_stream = stream_config->type == SDW_STREAM_BPT;
 	struct sdw_port_runtime *p_rt;
 	int ret;
-	int i;
+	int i = 0;
 
-	i = 0;
 	list_for_each_entry(p_rt, &s_rt->port_list, port_node) {
 		if (!is_bpt_stream) {
 			ret = sdw_slave_port_is_valid_range(&slave->dev, port_config[i].num);
@@ -1069,18 +1073,32 @@ static int sdw_slave_port_config(struct sdw_slave *slave,
 			 * A port in the generic valid range may still be unsupported by
 			 * the Slave or unavailable for the requested stream direction.
 			 */
-			if (!sdw_get_slave_dpn_prop(slave, s_rt->direction,
+			if (!sdw_get_slave_dpn_prop(slave, stream_config->direction,
 						    port_config[i].num)) {
 				dev_err(&slave->dev,
 					"port %u not supported for %s\n",
 					port_config[i].num,
-					s_rt->direction == SDW_DATA_DIR_TX ? "TX" : "RX");
+					stream_config->direction == SDW_DATA_DIR_TX ?
+					"TX" : "RX");
 				return -EINVAL;
 			}
 		} else if (port_config[i].num) {
 			return -EINVAL;
 		}
+		i++;
+	}
 
+	return 0;
+}
+
+static int sdw_slave_port_config(struct sdw_slave_runtime *s_rt,
+				 const struct sdw_port_config *port_config)
+{
+	struct sdw_port_runtime *p_rt;
+	int ret;
+	int i = 0;
+
+	list_for_each_entry(p_rt, &s_rt->port_list, port_node) {
 		ret = sdw_port_config(p_rt, port_config, i);
 		if (ret < 0)
 			return ret;
@@ -2020,6 +2038,7 @@ int sdw_stream_add_master(struct sdw_bus *bus,
 			  struct sdw_stream_runtime *stream)
 {
 	struct sdw_master_runtime *m_rt;
+	bool alloc_master_port = false;
 	bool alloc_master_rt = false;
 	int ret;
 
@@ -2065,19 +2084,23 @@ int sdw_stream_add_master(struct sdw_bus *bus,
 		if (ret)
 			goto alloc_error;
 
-		if (sdw_master_port_allocated(m_rt))
+		if (sdw_master_port_allocated(m_rt)) {
+			alloc_master_port = true;
 			stream->m_rt_count++;
+		}
 	}
 
-	ret = sdw_master_rt_config(m_rt, stream_config);
-	if (ret < 0)
-		goto unlock;
-
 	ret = sdw_config_stream(bus->dev, stream, stream_config, false);
 	if (ret)
-		goto unlock;
+		goto alloc_error;
+
+	ret = sdw_master_rt_config(m_rt, stream_config);
+	if (ret < 0)
+		goto alloc_error;
 
 	ret = sdw_master_port_config(m_rt, port_config);
+	if (ret)
+		goto alloc_error;
 
 	goto unlock;
 
@@ -2085,6 +2108,10 @@ int sdw_stream_add_master(struct sdw_bus *bus,
 	/*
 	 * we only cleanup what was allocated in this routine
 	 */
+	if (alloc_master_port) {
+		sdw_master_port_free(m_rt);
+		stream->m_rt_count--;
+	}
 	if (alloc_master_rt)
 		sdw_master_rt_free(m_rt, stream);
 unlock:
@@ -2150,6 +2177,7 @@ int sdw_stream_add_slave(struct sdw_slave *slave,
 	struct sdw_slave_runtime *s_rt;
 	struct sdw_master_runtime *m_rt;
 	bool alloc_master_rt = false;
+	bool alloc_slave_port = false;
 	bool alloc_slave_rt = false;
 
 	int ret;
@@ -2200,24 +2228,30 @@ int sdw_stream_add_slave(struct sdw_slave *slave,
 		ret = sdw_slave_port_alloc(slave, s_rt, num_ports);
 		if (ret)
 			goto alloc_error;
+
+		alloc_slave_port = true;
 	}
 
-	ret =  sdw_master_rt_config(m_rt, stream_config);
+	ret = sdw_slave_port_config_valid(slave, s_rt, stream_config,
+					  port_config);
 	if (ret)
-		goto unlock;
-
-	ret = sdw_slave_rt_config(s_rt, stream_config);
-	if (ret)
-		goto unlock;
+		goto alloc_error;
 
 	ret = sdw_config_stream(&slave->dev, stream, stream_config, true);
 	if (ret)
-		goto unlock;
+		goto alloc_error;
 
-	ret = sdw_slave_port_config(slave, s_rt, port_config,
-				    stream->type == SDW_STREAM_BPT);
+	ret = sdw_master_rt_config(m_rt, stream_config);
 	if (ret)
-		goto unlock;
+		goto alloc_error;
+
+	ret = sdw_slave_rt_config(s_rt, stream_config);
+	if (ret)
+		goto alloc_error;
+
+	ret = sdw_slave_port_config(s_rt, port_config);
+	if (ret)
+		goto alloc_error;
 
 	/*
 	 * Change stream state to CONFIGURED on first Slave add.
@@ -2234,6 +2268,8 @@ int sdw_stream_add_slave(struct sdw_slave *slave,
 	 * is intentional, the 'master_rt_free' will call sdw_slave_rt_free()
 	 * internally.
 	 */
+	if (alloc_slave_port)
+		sdw_slave_port_free(slave, stream);
 	if (alloc_master_rt)
 		sdw_master_rt_free(m_rt, stream);
 	else if (alloc_slave_rt)
-- 
2.56.1.750.gf70dc682cf-goog

