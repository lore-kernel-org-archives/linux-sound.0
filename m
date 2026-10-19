Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792429394;
	b=v2i7snQwe07T5JPY8Zeuftnsqk7m4iB8PpwK+x+Xz3qum39ODco6PfF3KNbjHXXZEUYR
	 ImIXGKT525QP2Xni15KwIp8OorvAv9maq91jSaLoyzHciZXnFMPyPm8FqMrCN3/rYez8c
	 q+B4f7HRmPbMEvYJafqy8oz5wHFOpNGG4u6bpSPdA4sZaxh51+kVI3BQJQY83WxtGmYHB
	 5LVG5NpZPbYAH8TSdt7oQh/Z4bl36udC4rrQ7Z3hE1ZBApHMW0wBTRr6mYUWIYhgZ1ITa
	 m3Xd2aB5oxP9ksF09pm2dFd2y86Gudq5ZunGNb0CJFYkQCA+rekQsjHGYdENN2c7e1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792429394;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=aE/ApdweHqbDn8tPYpZEvkT83zo8gImkOax/EesADG0=;
	b=loEtdyCVcOzSpA25Dx8WbsgpqVtK7gbdsfPrtHbzn8ib+767+gIM5HIjJffHA5t2NGsW
	 DBtwWXBV4Yk5EJWC7WDoaEB3z9gaLkglefIc/tv33VVac3Dws5TYXLMAhploukw31ZoKK
	 3NlTbv9M9NWLtCWRBerX5qftTyPnZkmTRieCa8Qcd0bkgoitHyJH9nOOyJKewHuBE8hse
	 Y1KhD57bFNJ8yOqw0O2Y6g2M9GqzQdGEHi3D6puk+/4jpU0sqmNf05OAaS74GGu05wReg
	 Mf54KeMw/IHD7rLML6vbhPaHIYRDIzik7OHJaS48auW4EpUvkijRTbETw0HOdCWsRhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pZME4in2;
	arc=none smtp.remote-ip=209.85.210.181
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368BE606A31B
	for <linux-sound@vger.kernel.org>; Mon, 19 Oct 2026 17:03:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 368BE606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pZME4in2
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8a06b27bf9bso449781b3a.2
        for <linux-sound@vger.kernel.org>; Mon, 19 Oct 2026 10:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792429393; x=1793034193; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aE/ApdweHqbDn8tPYpZEvkT83zo8gImkOax/EesADG0=;
        b=pZME4in2/dovMnIJC1alUj04UbIDFKIvNIIUQzlCLJRJQ1igaXXGunRER55yDQ/h9+
         q+PWrDGkI0JrvmvTFD3Okb7MAOw2zCCWgU8QzfMIQ1/eQQq6en9WrkC8QRhtaHMGzRuF
         K7N7K+1D566unZhGmpvSjbpmRRWFVcmysqvp4VquNqD2W3bAFP4M+pzzr5UenjVzap8L
         kQ9rxmmv9qr0A6Yem9CJrpH6vU58MQlvn8BrmeBUC2xPkRLyFsMAhVHM90HfxvKzzp6D
         cwt+I7BKTjCKAxMaAKV1jF0nIkUWRvDHXZCtWkOzhrYqcObEm6OfMkKYthMjqlS4YrwQ
         WecA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792429393; x=1793034193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aE/ApdweHqbDn8tPYpZEvkT83zo8gImkOax/EesADG0=;
        b=BqAWM/2vdXIXfdbte0thKHzc0z/AcfFmQpKklIi5ZFi1cCAJjHUL+XLYTP9KtcJ3JA
         BUKESq+UOmLwLUp1vcq8ztrN6XtNy3+AI+vQOCPqfRNDP+P33POK+E+eKnzv4df4lcfV
         YZy6xqqN7u7spYp2uY1iG6x3VBuL7hONpCEX30JeGjyUIQzrQk0F7x8Jg39ZQJY6xEVc
         ldyR7eFDRQctK44EtWwTRKsEhfTzVp/f/MfdXcVJYZeGy1TcIlQGKEHQA7nxymRh6IYM
         Ns0bbcI14tK46abBGXn3TeSWQ8ax+TIuJQf3FYTnMci9bbhnMHgMcZsxjgtVpCL+bir0
         JrTw==
X-Forwarded-Encrypted: i=1; AKwUvBwY1PLizxvoPyZPeLfcA2QIdvKc5+Mynmt2PwK4DUgwKqBnRWH6aYbLmbuN3bf+P7w/57yL7CkSawMVBw==@vger.kernel.org
X-Gm-Message-State: AFq9FYKdLaD8G1S98gZMBxXFQtBGaVnJQ8tYg7sUTWuX7oOsycPA+J1m
	Zev1j+eesI0CJ+H7jhfOVIvlBk+CjxVBjIcCUljJZlm9ZdnYO2zOdCum
X-Gm-Gg: AYBFou2p0ROgYSH5VhaMxlCi28gJyhkqF/WUcX7T2+R0RxOkpTcOUj8LcWkSA2vqjCs
	i1sxR3UOZfqLTINuXCjJff2YUzE+DD3giTGkIl6c0hLSJVzIor6YBjO7VL6qjuHWHWcbCS3slc1
	JGSKKdsbIglxNxuWIsOB0SEQUmeBzYDS34nLgZTQkK3HoUGAZsNhZSVlFv43qL36hE1lcHpHvNU
	a8yNcYTpn1nejix5gTMjoG2itIVvwxZGqK0x/W3KMu6XFYemxgHZFLnT3+7ci/mXqSync1LT6Hz
	+x9tG5Up3oL1ysxSUPlQ7UIushao/YRFqG6lUuBx41ptGB84sr+TrTbCBabJHZ7EJP1rHlMOrE+
	y2uJ9iNMKCAQy8EQ/mbGAalFbjT9AhIyuF/o2BPpI0Gb+JinwFz/73GY6VqemcutRaJHTcFoG2Q
	ccm541dCyXrcbxlDWwJpAsqCnYD6IG61omfR5WQ8abBevswAXqqoRacVR4fiTNvDx+dC/TOyBgb
	UXo0aiFvV3LNqw=
X-Received: by 2002:a05:6a21:9147:b0:3e0:dbf5:59f1 with SMTP id adf61e73a8af0-3e226435453mr6238043637.91.1792429393230;
        Mon, 19 Oct 2026 10:03:13 -0700 (PDT)
Received: from asahi.tail4da9e3.ts.net ([218.48.198.193])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd6549c5621sm4317511a12.17.2026.10.19.10.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 10:03:10 -0700 (PDT)
From: "Baek Kyu, Kim" <pocj8ur4in@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Srinivas Kandagatla <srini@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] soundwire: qcom: restore port reservations on registration failure
Date: Tue, 20 Oct 2026 02:02:03 +0900
Message-ID: <20261019170203.2533974-3-pocj8ur4in@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261019170203.2533974-1-pocj8ur4in@gmail.com>
References: <20261019170203.2533974-1-pocj8ur4in@gmail.com>
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

qcom_swrm_stream_alloc_ports() ignores sdw_stream_add_master() errors and
returns success after master registration fails. Reservations made before
registration, or before discovering that all ports are busy, also remain
set in the controller bitmap.

For example, failing the second of two master port allocations returns
-ENOMEM from the core, but hw_params reports success and retains the new
port reservations. The stream is marked as configured despite incomplete
master registration.

Save the bitmap under port_lock and restore it on either failure, then
return the original error. This preserves earlier reservations and allows
a failed stream to retry. Remove the hw_params error cleanup that walks
master runtime ports: that list does not reliably describe reservations
made by the failed attempt. The allocation helper now restores its own
reservations before returning.

This patch depends on patch 1/2, which rolls back partial master port
allocation and failed stream configuration in the SoundWire core.

Fixes: 02efb49aa805 ("soundwire: qcom: add support for SoundWire controller")
Fixes: 5c68b66d4d7e ("soundwire: qcom: drop unneeded qcom_swrm_stream_alloc_ports() cleanup")
Signed-off-by: Baek Kyu, Kim <pocj8ur4in@gmail.com>
---
Tested with ARM64 QEMU KUnit using synthetic devices. Failing the second
master port allocation made hw_params return success and retain
reservations before the fix. With both patches, it returns -ENOMEM,
restores the original bitmap, and allows a successful retry. No physical
Qualcomm audio hardware was tested.

 drivers/soundwire/qcom.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 55678a30cd4a..586bdd17171a 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -1241,7 +1241,8 @@ static int qcom_swrm_stream_alloc_ports(struct qcom_swrm_ctrl *ctrl,
 	struct sdw_port_runtime *p_rt;
 	struct sdw_slave *slave;
 	unsigned long *port_mask;
-	int maxport, pn, nports = 0;
+	int maxport, pn, nports = 0, ret;
+	unsigned long saved_port_mask;
 	unsigned int m_port;
 	struct sdw_port_config *pconfig __free(kfree) = kzalloc_objs(*pconfig,
 								     ctrl->nports);
@@ -1260,6 +1261,7 @@ static int qcom_swrm_stream_alloc_ports(struct qcom_swrm_ctrl *ctrl,
 	sconfig.bps = 1;
 
 	guard(mutex)(&ctrl->port_lock);
+	saved_port_mask = ctrl->port_mask;
 
 	list_for_each_entry(m_rt, &stream->master_list, stream_node) {
 		/*
@@ -1286,7 +1288,8 @@ static int qcom_swrm_stream_alloc_ports(struct qcom_swrm_ctrl *ctrl,
 
 				if (pn >= maxport) {
 					dev_err(ctrl->dev, "All ports busy\n");
-					return -EBUSY;
+					ret = -EBUSY;
+					goto restore_mask;
 				}
 				set_bit(pn, port_mask);
 				pconfig[nports].num = pn;
@@ -1296,10 +1299,14 @@ static int qcom_swrm_stream_alloc_ports(struct qcom_swrm_ctrl *ctrl,
 		}
 	}
 
-	sdw_stream_add_master(&ctrl->bus, &sconfig, pconfig,
-			      nports, stream);
+	ret = sdw_stream_add_master(&ctrl->bus, &sconfig, pconfig,
+				    nports, stream);
+	if (!ret)
+		return 0;
 
-	return 0;
+restore_mask:
+	ctrl->port_mask = saved_port_mask;
+	return ret;
 }
 
 static int qcom_swrm_hw_params(struct snd_pcm_substream *substream,
@@ -1308,14 +1315,9 @@ static int qcom_swrm_hw_params(struct snd_pcm_substream *substream,
 {
 	struct qcom_swrm_ctrl *ctrl = dev_get_drvdata(dai->dev);
 	struct sdw_stream_runtime *sruntime = ctrl->sruntime[dai->id];
-	int ret;
 
-	ret = qcom_swrm_stream_alloc_ports(ctrl, sruntime, params,
-					   substream->stream);
-	if (ret)
-		qcom_swrm_stream_free_ports(ctrl, sruntime);
-
-	return ret;
+	return qcom_swrm_stream_alloc_ports(ctrl, sruntime, params,
+					    substream->stream);
 }
 
 static int qcom_swrm_hw_free(struct snd_pcm_substream *substream,
