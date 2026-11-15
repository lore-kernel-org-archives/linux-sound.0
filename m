Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794738026;
	b=l+tLPz4ZcIEV4Y2FgctmJeBN8m8mrIJQWtEFWwMIyt3x/4RnixuzxDtgBHKq73jw+8eV
	 oZ6q9po5IHnMy+CLCQW8ypHJvgX6EEpw9Ww3uKK/nw/Wss1/mE0lIfUo50UGDZszJUN6c
	 CkeUNb3lCl15vJXGxjS4NeEDYWwB6oEjsb4KuVLNyJyXYiZ6O+D1sH6ZlsGeTEVQisNLN
	 A+nvpm32Y+EpE4yMjA65RXoPbYzndUYDbAxNql2HMXE2MuET9pSlYtno7ggLgvT1HPGNH
	 wNtwOz89wjqqxYPfYCAV+XQivFQknS839XAYGPEXUXPdAN77R0xBWoBJo93DRz/NhKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794738026;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xQfYxpL6lo9pYgDOJuLLgqLwsPxOt7f8C+HuvbMdigk=;
	b=5NJqL7yWjBwM+eO+Kgr671w+b0dBRDdyt48YRwp6T6sr4UN9/Hmo5evEND5EoFsmGQrl
	 10hMoPewFEy/HqMyMYTmWt60hzUCcNdunmqeQGZm3vHEs7H4VG2JXdys8n855uv4OOuMe
	 i4u9DGkL99xQfG1s6dVWSlDe71AEF8bbLE517aaEVYiG4YFnCIkqSo3Ya9hXRTGadNB8k
	 nM7BygkZmTru6xiDFn+vkNgRMJj0kADPSed8+TENJNCNRfVnfT6zRBxjjB33zNOvO5qlQ
	 Fi3PXHWY5E6lThv/bMLFYeHOpVSSeWSJ10pRntXBxAyWE17qlOtgBPkYqrg8Llc8ytQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zZwsyJNt;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E087606A323
	for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 10:20:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E087606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zZwsyJNt
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-15ea896ddc8so3594559c88.0
        for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 02:20:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794738025; x=1795342825; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xQfYxpL6lo9pYgDOJuLLgqLwsPxOt7f8C+HuvbMdigk=;
        b=zZwsyJNtGDWan8kATjQgxksVa5Zz5IpF1j8UPJmNbFBAAgKI0T9ghwqkX+KSvXVcpM
         +Ew7Bk/Kqg47mkM+fQ1mb08iJaEUk6yuRhFLZmsZb26LJ9MQvrZ6v4+sfz9bevCqy2IZ
         +htLa2KlfZTE/ohqyozttdy66yvV00EdTUWhysKgWXyZPSrA71c538aZVHm42QzneWpt
         6P+1dtM6Sej6RHsgbJH+8BJEmsU6cyuyvPqTDd+TnGdUbX+nxHUDX3PjWJXX6UOJenZ7
         1CfNx4hUIGNIaGCgntIjqV3tJUgDE8AMOiZ+Of8CxkGJTMuj8Fb43LKw9wAAvlj15rUW
         qV3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794738025; x=1795342825;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xQfYxpL6lo9pYgDOJuLLgqLwsPxOt7f8C+HuvbMdigk=;
        b=t0cdo55JClvQvst3jtOhqEToJqgiPBZ95D28Bc0JUO41+gtMrSABZfnEnXKVtAJ5lN
         kv8GEIViJcOeg895/wVC9MHaWwUgZ/do4JYEqcZ0P5E5Q6HCj2T0fJIg4eBpq4e9S9C4
         2CyFRTPKAHFnQFz+zrn/5dcas8dcct9a8tuVCNL2BDDk9WBbbPoxHSKIf3isb57x0oar
         2iDuqCICLk0kqpnsO1pRzYJxnwHhY3tI3nhyxCqAjFrCcvigXJ6NNbvN5aZEw1R995Is
         L78/oh1P/6cyKlUyH2HheJhGyN6jxhJbhw/fiY/p8AXgH0K/zQ25Q6iuQuVL/wJdRcph
         fX5w==
X-Forwarded-Encrypted: i=1; AL+hErFJOAEgibhf0CjIqna8lts1xzIXAzCZ8AX7M8pt3Iq7fLhQ/zkRhEOEo84UiNcK2xzYuaq6Rr/h1Z1jOA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+CLMUDIbjBpzCAAsHzcs67dTXzya0BVu7Z3TqpytqF0wMPS1wi
	lYgIVCtV7hffyiAA+QS1gBP74kslies48+/e2tzG7112M+KSH6dtFWvZ
X-Gm-Gg: AYBFou1q9w85Ec0VlPmFik5xlVjyHnfMmKOX31MNAeWSeWDMl8exZFUv2udY2NeSbms
	1fS+zSuRK04jYXLiutsUxfcEavRRj/rR+LkplNQ0M4zxjrrQjU6vmC3eB/eOHFNNdFwJJ0VS6M1
	sblfG81D+r+tj5JLrS/+KlzjZwJPPt4A+iYTkPW7JZobn5jl3gAY/HqACHeY7n9P6Qe/quSR85C
	tElsgUsnvil8TgY7RPotGM2PxHNR4tzJJZqSoN/uTWKmdk1bVuy303RyECwnJqmcFjVJv6G1FhX
	zgqJGPPlgzMEliO/9WYo+YT7zU5Yi2qGmamGIvJ01+B6VcuhZw2rNo/Hr4YlvzVf9ZCp6aBlaof
	7c31+VgTwKIkLPWQSX/D3jDy/p97vx2cvOJAW0cLKb0aB7asGqnawY1tgH5Izq2KF0Fl0nRjwCh
	6YVrPhq4nrYvPEQqJiMkyH9kHJMc3mRmcA9glgt6SEMmgIDxO5EQQ8k0/eUYTcf1oNXM6gPliSO
	xphS0jJJgDIp0+iEJU4WqCFIxFldimitVYhQ11XNQrKFgI+UeG4c1P9fEZd0vteMjrMSb5BFmQd
	tQZ81atxhdF6ZJKtYMIc0z+jAn5NZxokx0/f28K6jWVaDwNeTVhm
X-Received: by 2002:a05:7300:6d03:b0:36c:3b8a:8090 with SMTP id 5a478bee46e88-37963a4ef35mr11465212eec.2.1794738025200;
        Sun, 15 Nov 2026 02:20:25 -0800 (PST)
Received: from localhost.localdomain ([103.178.204.102])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379569b8389sm40237254eec.25.2026.11.15.02.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 02:20:24 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: perex@perex.cz,
	tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Subject: [PATCH] ALSA: jack: Fix control leak on jack allocation failure
Date: Sun, 15 Nov 2026 10:19:49 +0000
Message-ID: <20261115101949.2483-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
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

snd_jack_new() creates an ALSA jack control before allocating the
jack structure.

If the jack structure allocation fails, the function returns
-ENOMEM without removing the previously created control.

Remove the control using snd_ctl_remove() to release the control
and its private data before returning -ENOMEM.

Initialize the control list before removal so that the
private_free callback can safely remove the list entry.

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
 sound/core/jack.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/core/jack.c b/sound/core/jack.c
index af2dc2cfbe19..92febcb42a8d 100644
--- a/sound/core/jack.c
+++ b/sound/core/jack.c
@@ -555,8 +555,14 @@ int snd_jack_new(struct snd_card *card, const char *id, int type,
 	}
 
 	jack = kzalloc_obj(struct snd_jack);
-	if (jack == NULL)
+	if (!jack) {
+		if (jack_kctl) {
+			INIT_LIST_HEAD(&jack_kctl->list);
+			snd_ctl_remove(card, jack_kctl->kctl);
+		}
+
 		return -ENOMEM;
+	}
 
 	jack->id = kstrdup(id, GFP_KERNEL);
 	if (jack->id == NULL) {
-- 
2.55.0

