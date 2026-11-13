Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794561991;
	b=n3L2K2xKcsxn1C99OoGRghhtk2v0g8SiR8+dziEhWgHsO5rg6w+HltIlSM8EY4ZuTufA
	 LkdTJuI/OUkgE6TjU9lB9Nhst2P0qSw8AUPWYRPlAgpClW6gZ5EiRR0mu6vuXTndZ+eZt
	 Bea3wadNFKft6801bWnM+HBbiiluflTd1SzfJjC8vb+Y7j75m+ceLlnAu7Y1DU0ntwlwI
	 8mNyXTsV5n2kxl2FaOaZkDy/K1aUFuqUJ8+W9He4cCpc4qJQl/LbPlU1PSM6MqQA2uMAo
	 K2KdFjj6SRKRqEo6mXWqKnXpjaUkL6IzmLbys//mPclmjS8577iwTbTjJYUOcGe9QlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794561991;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=679sas+zR3mHyWdjZLnxDeN5FJpisEUo0YFV1RY5cPM=;
	b=TCckob+h5CzkFoy6WbrDi6tZ3Hj+P7KG2F5vaQfegxwrYxhmZbWKGSl9LWyMdeWJY6Og
	 76SNhFmajy6Gg1YBBN61FCSfX8M063I0UR3UFu7k6VRFNk91w/vc5O1bEdKrtYSc+CeYm
	 Zp3OAYfC7VAdwtXGnvEONB2LVnSqqdPZ3eS01dAPI/SOSyA6uIBQmTSwjZxopND0kfZ6X
	 Q+/aLVXZuFORr4zvgi52fEU5w3bq/WuRLHkiNN6ngt3vUntUgAKb+F1x3lk5QU7iOxIck
	 ky/bYgF0WPuOGPnV7NMWsQtUSzhxfFf9jUTd5GrgPBgfS3EdyK3RP4x0j7K9pUACmKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t0APHpw+;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDFD6606A338
	for <linux-sound@vger.kernel.org>; Fri, 13 Nov 2026 09:26:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDFD6606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t0APHpw+
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3282db206d3so1786265eec.0
        for <linux-sound@vger.kernel.org>; Fri, 13 Nov 2026 01:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794561990; x=1795166790; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=679sas+zR3mHyWdjZLnxDeN5FJpisEUo0YFV1RY5cPM=;
        b=t0APHpw+tV8WdXMrzzJp48ybd+e0EeU72fhK+PPB9RTxGEMRXZyvsnljw1arSnPMZU
         9vZqfnK4SJJbnXJfIUmVwmB/W67ZD6OX6SwsTdpBjs17+z+uZWeK77zcKEDBnwdq/tJS
         oQMDH6sUbWfPjdYNv0R4sh7kH2OYq5k3TtkKEHgzOJ+SH24VGJ+3l/KDNPzUsnNY2Tla
         Mno/hXe+ZPjANVDbCu3Zzo1ra5sHBz99sJ5GC+YV5JpLKW4HqcouXH0g5vUxKo7ygtgQ
         o3p32WBnkwFNQLepju4esIRk5owebghasebaupnoQaSAHMmRrCpFMPM0z6zF+O6VnQbp
         6nPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794561990; x=1795166790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=679sas+zR3mHyWdjZLnxDeN5FJpisEUo0YFV1RY5cPM=;
        b=yq/pRnvXaoWXr6fUcxKiVucZBzBv3smHtQQMf3oEExuzfRw8tL7xcmUKpV2ebhLlHt
         2/DWeP+AIsoxmgNKXKwr/aC6ZGDr1DrLfUklxCVhm44NcsmqeYzonVarzvc82sgQ2s7o
         oIw8w20mq/Y37XdLybttzhAZ3JmDA/Fo342moNK+jQ4lBhvYDjhtCjhT2MYx6T0CsMpf
         po4DuFFBwetYmg3laQxeuJGenSWorucdAlam242Fb/OiZsKbZd5nzFpq/Cl0Q1f9sdyz
         nnrir74PCzi3ya4Xe3nEMitC76GWpLU0L7EsgBIBeT57SXiUUorUoV5f81L6vTLK45Dh
         9uAw==
X-Forwarded-Encrypted: i=1; AL+hErF0BMv23v/QM6MhNzoH64G1JEO1tTtTcGdgTD24UZcISjTyHbLHv2Hk4CkYpKeyw8j6+UibCF/KMyii3A==@vger.kernel.org
X-Gm-Message-State: APuU4Z8kMV+Km9s4L3x0RALRhaMpECi/n9o94tcyb6Cvtr6Hea9umaWB
	MnahwTffGcO12B1QbLFxcteA5tIrIdBqQtLBu3kQ+0h9NacFS8gQld2veMFOD/iR
X-Gm-Gg: AYBFou0PfRI/eyWjaTI+M/GSR7zJw+ugL1tI1uOxae9IAuRzgvL9CgDW/wwBifjsRBW
	DJaR/3D+xnVLW6z1R+3m6MNKPP3UdxYcXmVVWqM9RxIQbpf0Hc52o/OXGOk3z5eJYJYGTVN3GA2
	lpe4r9e+iiUs0FN1iSZ2HDB0rl3HxbHw4mcIMMOIDiyTF6Yz3N+M0lmfvLTsv00bRpukEKC0KuM
	FSS6Mu3P6youhK1xFIY0gacFAROqz4o9u27ngM3j3f+DPYqaJhnh1lXoE5kB9mYPDrAZgOnzEtA
	slDik8WWpuaP2zazqiVqsUiZJyV0V2YUWtj4pPgP2PjoptxNTeY6idatvOyX1qSpyxDNu2SsoDa
	vY+mtvRWkhKGJFg6bdHuiuWienBDzbUeY/bATKbKgZ5GKeRtTJX2RP2i1fkjId5sN70x0dj9NF5
	xur0VXRteEuMOgCcZqAv65xpX5hi7gVSLYvD2FwnvVC8ZUYuehpUQqWojxnvcX1C8qoXMEgjd/0
	Za7YPHc274tlTjJiizOHgYC7Yq2CGuVUA25zAR/rhGPGqM/sgPuwhK6+fc3IZLcNPGX5CIk05wE
	tZvQCz4K9BDnEfsgMO5OQXuCeEvf301KHtqZVGrbOMDg/e+SEzzk
X-Received: by 2002:a05:693c:60ce:b0:36e:8410:ecf6 with SMTP id 5a478bee46e88-37966387d74mr1963510eec.13.1794561989903;
        Fri, 13 Nov 2026 01:26:29 -0800 (PST)
Received: from localhost.localdomain ([103.149.158.176])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795533170csm6098717eec.7.2026.11.13.01.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 01:26:29 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: sreekuttan2156239@gmail.com
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.de
Subject: [PATCH v2] ALSA: compress: Set metadata_set only after successful callback
Date: Fri, 13 Nov 2026 09:25:59 +0000
Message-ID: <20261113092559.3283-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261113091159.2954-1-sreekuttan2156239@gmail.com>
References: <20261113091159.2954-1-sreekuttan2156239@gmail.com>
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

Set the metadata_set flag only when the driver's set_metadata()
callback completes successfully.

Previously, the flag was set even when the callback returned an
error. This incorrectly indicated that metadata had been applied
successfully, potentially causing later operations to skip metadata
setup.

Update the flag only when the callback returns zero so that its
state accurately reflects successful metadata submission.

Fixes: 9727b490e543 ("ALSA: compress: add support for gapless playback")
Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
v2:
 - Add Fixes trailer.

 sound/core/compress_offload.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
index 5e5e0f78f26d..9b53282e0192 100644
--- a/sound/core/compress_offload.c
+++ b/sound/core/compress_offload.c
@@ -796,8 +796,8 @@ snd_compr_set_metadata(struct snd_compr_stream *stream, unsigned long arg)
 		return -EFAULT;
 
 	retval = stream->ops->set_metadata(stream, &metadata);
-	stream->metadata_set = true;
-
+	if (!retval)
+		stream->metadata_set = true;
 	return retval;
 }
 
-- 
2.55.0

