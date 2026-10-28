Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793199320;
	b=0Szw3mcCa2b04KA4tdgQ/b+YpE2gbo9xJTiDpWLwIyuehCjweYhyimvxU7ebMa+hT/CE
	 nBMUbOuqiwL4S2TRXNh7hmW8EBznKM8PlZUpBOPAtPmAB4iYKArY+3t3vW0QdeNvAOtCV
	 Ip3ez8Sq1qr+qwF/LFJxMXOZ5fTy4uI9FauR7zpfkjSMmAb6ya5xExp1qoj2j09DIZeT6
	 Hwalnfekm5yLRz9d+JFhdUTS32RrzU5BAcxvXNzNn+85j3k67WVGsGhIKiNfpYRNnd/e8
	 I/8m8AVSudlajeznm+muoXaSVHh8ptSJ0TL9nx2EqvlQRGCRzEcrM7GtY7lVZx5d58g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793199320;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=meU1m866/ygpxNHbfayzs25nVPOgWuaJgkSGzs4sStg=;
	b=cpHwN7XopohqZnF1EmKSefkdpub+GIHvcelSViPMjMJVX19ldx7jkppxMX5uyQMNjo0T
	 Jued3ftI6Uw9f4qRiKniMMKqzburGKF8PXkHlV2FOf6BkkbawFOE9EWwK7JsirwmZYjSu
	 59V8gM8D/YmK7BgJti4kGq2KDOn9+pRFbqix3OPqAF9tZCt2HdlwSXKR4sOeoibGeIUrV
	 iVHgfM0IVA/KHIkv2qFgbFz/PVEJQj46M8LwiwzdxLxJl/mtKRFueEEYAOlrhWac1RyM6
	 Rj7CIY2os3mpgYwfDBtI7zF/ii+btzpYSuwOLINs+cyKnBu6Lk6lOA9xN9DsexxLPHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ll3SC1US;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A146606A31A
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 14:55:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A146606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ll3SC1US
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48e10a70540so699012f8f.1
        for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 07:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793199318; x=1793804118; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=meU1m866/ygpxNHbfayzs25nVPOgWuaJgkSGzs4sStg=;
        b=Ll3SC1USAj+MFGElknEKyTZs3ptniL2lDh8IEIUgbP9oTcGk8nEXveAsuwV+ZIBuRB
         Hf1pkqzw+gbcl6jRLVtfj/RdAIAjCwEXFxHH643Lz7716ngw7zmrDfmcXO+D1wu1Bpr8
         ZjNF+darVQSlT5ZACsMCcXIwYz42k4HYZ/zOgbTuSpSV26gIX+Wtmf84iRxPjkHC9zWZ
         RKB4PgTGhOchFEdhEJnTW/DU2SEcNR1y3xuyFXGa5pOqnxTgQz7zQta/M2j/rOdzpe/z
         7Qfr+U7y3qldR2qRm2JByNVJm1zslMLzeSNlLFQ18Lfndc2w2HIz5c+GdxDMaoOvhk2d
         qt4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793199318; x=1793804118;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=meU1m866/ygpxNHbfayzs25nVPOgWuaJgkSGzs4sStg=;
        b=KAJ/R8Hzn8qN1mP2HUcIyY3ngDkx97tWAUlkXIk+iHz33/TTM+SZXnBiyniO4hbHKE
         pJJkaVz+l4Z/k2CSW5f8hfAx4xvYhYJrAZT7YHQRnOpK2ZnOYCQ2AUBcThE1e74D1rBk
         GOKnKNSiPMhD0lTSedW/x2GptK329d+ICZIg6RONDtC3YWDNty6nV0UZTAJhZUUde7Kg
         x7b9kfSScDVhR4ygwF3Hu6V5CC6T6jQqghdWMqfyZdYeDbGj2OJ9WYMtulVeYWHOVRs2
         KfRPEjeo3Ccgqa+JOHUOBEb8HGn6lTXspffutyXyrcGU/ZPhPltx5aaADH3ofic1xj4R
         h/IA==
X-Forwarded-Encrypted: i=1; AKwUvBwdYKOzlP5arKn4HGe5Jno/uouSC5I63acyO+nSE/lZM3QXBL54TROFyNO0U6qoE2wRwvSO3fxsDKCeGg==@vger.kernel.org
X-Gm-Message-State: AFq9FYLGKsk+Wh60lK+3K8HN84TYnzPnA4NMwe85cdfmr57O6uL8Hdem
	U9/teA/I0c8GeB5CpLhuffLJu2u+fAc2bMHD6NPyKaYydwPqO/HcoXj/
X-Gm-Gg: AYBFou3nn8zR1awc5J4sPc8H5M7/gag3xLGRfubhp/9QQZlV24b2kGTm7nKQjI5dd4T
	rzvIy/onJKyZso4zBRCgqrVoTt4Maej/l+SoasW0081FwsyL2KVqsANe0Vtu8djF8oyJCDUnnoK
	yTIHs0zcZU/egpP0J3U9/srMPnP8G2kye/tmEXlidg+HTy8RkBegv8VNsQ89vzAro0m6Chk9fnv
	Ibxdl48BShVJo4qmqtEz5LRHsoCGUe5O8mGhov5hkXKBBlfPuhFR5ZLx6EgIdrZxnm79CrluOul
	V6958zufibXh1jFhlpzuDuR4E4Jbf0q5Sl3uiELyO8aYzvTkjitrq7odKdXwTW/hRUk5od7anrR
	arU74V4O9PCUxzOTFmuBXkXBXHM2VDHpBhl7wFI/xTdKXHFCAbEygmIwOp9LTCOZeLY7shmEKfg
	qH2AcunOkrqCxQmPbjhmzzPGgksJTt+0qe5ZkEODSYD2PqqGB9g3ISMBe5WZPIUl41a/NULZNhn
	LlgnHx9+WMyS5j6pCyggG1IwxKW0Zbuc2aftJqFdP5ubWr+gKqKgEHAa3UkkYwabpmHeD+kevwd
	MZCTLztnM7xEqZIbIfgcqUEFbr0nBuv9L3RC4NtVdUoV
X-Received: by 2002:a05:6000:1049:b0:48e:4e00:b72d with SMTP id ffacd0b85a97d-48e5d5d0a6dmr4813779f8f.38.1793199317639;
        Wed, 28 Oct 2026 07:55:17 -0700 (PDT)
Received: from localhost.localdomain ([2a06:c701:4778:c500:47f1:8a3:6e76:cd9e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd37f4sm34432577f8f.44.2026.10.28.07.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 07:55:17 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH] slimbus: preserve ports after failed disconnect
Date: Wed, 28 Oct 2026 16:55:08 +0200
Message-ID: <20261028145508.1111792-2-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
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

slim_stream_unprepare() ignores errors from slim_disconnect_port() and
frees the port array even when a disconnect transfer fails. The helper
also marks the port disconnected before issuing the transfer, losing
track of which ports still need disconnecting.

Update port state only after a successful transfer. Attempt every
disconnect, return the first error, and retain the port array on
failure so completed ports can be skipped on retry. Free any retained
port array in slim_stream_free().

Fixes: abb9c9b8b51b ("slimbus: stream: add stream support")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 drivers/slimbus/stream.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/slimbus/stream.c b/drivers/slimbus/stream.c
index b4e70a7edd1cc..ab26b243802df 100644
--- a/drivers/slimbus/stream.c
+++ b/drivers/slimbus/stream.c
@@ -150,12 +150,17 @@ static int slim_disconnect_port(struct slim_stream_runtime *stream,
 	struct slim_val_inf msg = {0, 1, NULL, wbuf, NULL};
 	u8 mc = SLIM_MSG_MC_DISCONNECT_PORT;
 	DEFINE_SLIM_LDEST_TXN(txn, mc, 5, stream->dev->laddr, &msg);
+	int ret;
 
 	wbuf[0] = port->id;
+	ret = slim_do_transfer(sdev->ctrl, &txn);
+	if (ret)
+		return ret;
+
 	port->ch.state = SLIM_CH_STATE_DISCONNECTED;
 	port->state = SLIM_PORT_DISCONNECTED;
 
-	return slim_do_transfer(sdev->ctrl, &txn);
+	return 0;
 }
 
 static int slim_deactivate_remove_channel(struct slim_stream_runtime *stream,
@@ -448,13 +453,22 @@ EXPORT_SYMBOL_GPL(slim_stream_disable);
  */
 int slim_stream_unprepare(struct slim_stream_runtime *stream)
 {
-	int i;
+	int ret = 0, err, i;
 
 	if (!stream->ports || !stream->num_ports)
 		return -EINVAL;
 
-	for (i = 0; i < stream->num_ports; i++)
-		slim_disconnect_port(stream, &stream->ports[i]);
+	for (i = 0; i < stream->num_ports; i++) {
+		if (stream->ports[i].state == SLIM_PORT_DISCONNECTED)
+			continue;
+
+		err = slim_disconnect_port(stream, &stream->ports[i]);
+		if (err && !ret)
+			ret = err;
+	}
+
+	if (ret)
+		return ret;
 
 	kfree(stream->ports);
 	stream->ports = NULL;
@@ -484,6 +498,7 @@ int slim_stream_free(struct slim_stream_runtime *stream)
 	list_del(&stream->node);
 	spin_unlock(&sdev->stream_list_lock);
 
+	kfree(stream->ports);
 	kfree(stream->name);
 	kfree(stream);
 

base-commit: 65ba8f34ec886ec72b2c07ddc8cf3d815c32869d
-- 
2.43.0

