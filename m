Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795420571;
	b=T0U4hmzfnqEabQQQaGeCpW2vvfRtQqa5Q6mFQqYmmPrFxcT8IsjCZvI/hyE5v20PefIF
	 G0FmX7MdQkFDaTp2d06j00paSYm6waaZKewbF1VvlQmz++m610zTuUzwyINdVDlXZHjjl
	 M+AR8mpjSsii7pIOYF4B7+LHFjjhcg6jIvhxHAIS6jN05tZdKtgbiDPrLtpL3NOXDliVp
	 zakYsPKSTrjG7TDC9Wl/bYhFoE12WamuLlwJnA+sGCS5SgBAOd+ghQUV/dBHZu+pj50hJ
	 QIxyq/4fDwjg3FYZqWguzUGJSpC4TAewnj5T0CNqZR6e2t0pbbadZ6WUNCkLXBFxdEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795420571;
	h=Received:DKIM-Signature:From:To:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=xIvWT2gnfP5T3OT4//6KuPbQPQynD1bwik32TvuqPnY=;
	b=NRT9kkzuA+/1INl3UoAg90WpybghkNirkyiAZwuKcIwj9r5fCa4FKg9k3M6uyCi08erm
	 pT/YWVndKcA7iHCvb6As9llSh4jCXWEQRi/wYtCJcT9c3nxoTQqg6ka7pWEHhitNzpILg
	 S+kuaG8+I32SGesyvgPJ3tUw5uHz3HvbHGYREJoi+D6f3xw7uS99U/3QMzu7vrzUkTeIf
	 9ReK0x3F4m7TtJXhxB+AiZ4GNvcNGRghCumQ4bU4vyPFyJaa1P7iFr6acEqgNGoof6z7I
	 toWGne6B63sVeNJ8xHGATMN7hrHg4NhKUD+qqTlUkyS0WbJda6k4eYzWXhotVsZ1ZCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DaR6jJVS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E2D606A31A;
	Mon, 23 Nov 2026 07:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DaR6jJVS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5A671F000C6;
	Mon, 23 Nov 2026 07:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795420571;
	bh=xIvWT2gnfP5T3OT4//6KuPbQPQynD1bwik32TvuqPnY=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=DaR6jJVSlhvlluCZ6HZ5F5Jbkd3To/Xw6Qp0fcm9VVGWVVPN4L+LmO71W6PGLNI3y
	 dO1Kt0lM9d5ueKWesK+X0jfSQoayJy5hFKaHDn3Zwu/gGHoPYTbRQI5BeM6X8SUDfu
	 ga84xD4VLghXV60REhiK/dqr1xndfkrGW5m16Vgf48fhnK94xFUAiYQFi39gI9Bl8/
	 uottdR+MgQWMqVJYjIXUVHDMW1f5eo6bc0XwSBX9GhxrgfBwG4QFvK+TvOhaXBggcI
	 0Pi+onJNBG1kf3YVd9olz1ve5OKbe2Fd1uKb5sMVjXnulJ2ytLDIdZgCrSeUAS9/ys
	 wyl4bbFrZ+jvw==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Srinivas Kandagatla <srini@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 06/10] soundwire: qcom: Prevent pconfig buffer overflow in qcom_swrm_stream_alloc_ports()
Date: Mon, 23 Nov 2026 07:54:27 +0000
Message-ID: <20261123075522.405347-7-lee@kernel.org>
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

qcom_swrm_stream_alloc_ports() allocates the pconfig array with
ctrl->nports elements, but only checks that the assigned port number pn
is below maxport.  When multiple slave ports map to the same master port
via m_port_map or the stream requests more slave ports than
ctrl->nports, nports increments past ctrl->nports and writes out of
bounds of pconfig.

Verify that nports is less than maxport before writing to
pconfig[nports], and clear only the port_mask bits newly allocated
during the loop before returning -EBUSY.

Closes: https://sashiko.dev/#/bug/linux-543ea0c0-a6e5-4b03-a041-ea0a760802c1
Signed-off-by: Lee Jones <lee@kernel.org>
---

v2 => v3:
 - Track newly allocated port_mask bits in a local bitmap so error
   rollback never clears pre-existing ports

v1 => v2:
 - Drop Fixes and Stable tags

 drivers/soundwire/qcom.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 6e0c5fb10efa..16ad86912e51 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -1306,7 +1306,7 @@ static int qcom_swrm_stream_alloc_ports(struct qcom_swrm_ctrl *ctrl,
 	struct sdw_slave_runtime *s_rt;
 	struct sdw_port_runtime *p_rt;
 	struct sdw_slave *slave;
-	unsigned long *port_mask;
+	unsigned long *port_mask, allocated = 0;
 	int maxport, pn, nports = 0;
 	unsigned int m_port;
 	struct sdw_port_config *pconfig __free(kfree) = kzalloc_objs(*pconfig,
@@ -1350,11 +1350,13 @@ static int qcom_swrm_stream_alloc_ports(struct qcom_swrm_ctrl *ctrl,
 				else
 					pn = find_first_zero_bit(port_mask, maxport);
 
-				if (pn >= maxport) {
+				if (pn >= maxport || nports >= maxport) {
 					dev_err(ctrl->dev, "All ports busy\n");
+					*port_mask &= ~allocated;
 					return -EBUSY;
 				}
-				set_bit(pn, port_mask);
+				if (!test_and_set_bit(pn, port_mask))
+					__set_bit(pn, &allocated);
 				pconfig[nports].num = pn;
 				pconfig[nports].ch_mask = p_rt->ch_mask;
 				nports++;
-- 
2.56.1.750.gf70dc682cf-goog

