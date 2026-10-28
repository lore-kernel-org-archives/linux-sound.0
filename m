Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793180552;
	b=Bpjux0GT5HlswJkw8X2mSFTwEk5BNS1F3uTP8oEY5rcey4V8lFQXaciFXunuZfPLZUBG
	 v2TViVwDSZxW/gXlteBiBGzHizViv3Qk+xCn69izwTue3E4LmR3UZbA9vX0281ZXAqDhi
	 q4N1wvPZaNS0hbih9hon7avm94GJkXaGLD9z6wpd4Jed1W6Cjma7sd2e6ewpuzqPer6vu
	 yjg8/O/5ywV2HXa8HJ7DlpPVEFhybOHcPDEt+5d93ZuSZfDERezUUDwsrPEZbiyZbbbGu
	 877HWnioUEoGZc7JT7YLDDvszsH0qd6F/RhTiBoAD9nqkXZjzmuU863CNq5Aa+JnXoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180552;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xENf0eoUGZdfDkYJ3sDGskH+jC5/Mfw71VSp/kGlzNw=;
	b=46J5XKI6U6OGvyQ+mTZwF6IXnWuHYo+h6E6adcc973OuUiYmT83kHiQNlK2x/VZyjuDh
	 mqsIKVOS500UgHkFPV9uavaMqQyaxEDx7i1SC99v64HE5bJT7Vrpz9HXREhArseq0yjAH
	 vbmspnxuUZBO4hZWcA0X7gCsJwDOWiNpYOwSXIu74hL+R6QkqECFOfE/ieVP83ENNbmfI
	 3zYrKGfLEv2/juhZeZ70ei7zAdErkivpXF9wxtTarQa6tlDFB/ApERgi3X46DngoWspwQ
	 1CJk5C4XZo1NI4toMgCo3SZZlRkJG+vg6vs/pIz6kTgQoRMwGnkny+Wb/wWqWW8D1Uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g8NlGIXO;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED5FA60A3830
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 09:42:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED5FA60A3830
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g8NlGIXO
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cd5d2dafeccso451451a12.2
        for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 02:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793180551; x=1793785351; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xENf0eoUGZdfDkYJ3sDGskH+jC5/Mfw71VSp/kGlzNw=;
        b=g8NlGIXOA/gCtXZ/AwBmUMha/hD7dvU5ooqyd/MdITohXhlfRxEsrhBFq8QJQu6ucH
         Jlnw2MPPDDx/qxsdsdAC73zBeSKnCl4jiodalliTsMBjvFOYDMjdt3uh2fUXinicZQIJ
         L3fhmrzm9hX3m55XD8d44zNoarcI5aBZS75o+7OyjUIdXYxmti+PpJ88kyeUMgpsHePK
         5sfFgkmrdPtNPNKWfru7lIvpcbNLdHeIpH1BN8n9MmmvGKEeg5N6TCPE86mMKV9yvul6
         A3h7A+nmYena3VTMeniz7YvwwA1bnu/dCSBehkPeGR+2zxQBbmPwjUlr2qJ1e9xtCofR
         jqCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793180551; x=1793785351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xENf0eoUGZdfDkYJ3sDGskH+jC5/Mfw71VSp/kGlzNw=;
        b=bEOcLiwBF0TT2wziCPosD/TcU4ySLCbhohBuNYNXb8ufBuYQnJeeajXuV4DG88bBY4
         o9/Ix4pzpf/KS0mIUKaLTXcBIXoca+UhmfP9QUCkIPw/oWxQ7MJ/7onEGCWfZHxJR3dY
         4i+1MxxIVUatEQVw0EAYcTtY4ryRuZFLHysFa2gBcLFOYFKgi9mcOCBLWon6RMIa54za
         72c6bhUKFkWUgpJvn3PeSJ+owURR94QlvPkWrpAuyd+ayGa9K0sV6fFoprGmTOez84Kx
         GLLQ+QcWwmIGkQtVuKuECwtJwE7S5PIEhwbRtIs2SFlMhzeWOfsPlhvKhP81ePeq6OUi
         30pg==
X-Gm-Message-State: AFq9FYKOSEoX6Gm9WbgI1zH6qLuxOviAOYZsHF8RtpbwExDwr7wBzKJ2
	Yfy14jqOa1XX4OLAOkqqEH8miRK6S4BTRVz2ysHhGpn2pBA46z4vGHHpENPfCQ==
X-Gm-Gg: AYBFou10qMfbRbsn+eC0FoFZvaeSnUOOhlIMP5QPwYo0l6gpDVaTUXrafQukR6qGrJS
	UfDDqmECcFyl2XTsxAUE3yuquwj1bUMKWnH61WR5vHt7qIdtWMuYDO3zWROKCJYhA8bQpYtpmGa
	hq5Lr1E0slv8xVDtyUJxb/+KPIh4vHXyVzEjGOBE1YnJj3GMyuNGQ43018QXzZjzNe9DBwE2kGY
	9X/gltidC7Lpa46ECNswd0uuqrj+tCk9SeKaE+DMgW7nFS9RZCAvpNjC+NEzZm1npfLj7RhPRHx
	LvGResx8GJyP/vPH7wPIZP+CiCrD/B8WnMTnwhUKCFPWfLuKoTLeqOCmqXe9+l4i7xJUUAxMChT
	/LMub5JwGOIDfY5Ffw56xTLgtSBMR1mE+NT0AZfjpYl1jGx975GP5kCrV19pDFA7OFGKhnZe2FA
	jV3Eg5n4fcTMdfS2loAv+t9AmXSOV5uTWvmR+mrnQeVraZQTEJRdcT70OQLMhk+DcW++hKb75D2
	4Eq1mT+cgOBiXML5YcEkGbob0ux+Z/IO3Lwva97wfDtZwSimknQYmIPXvocFr6RdyoVBt2OxNXO
	OBTWE/1X2NsvFv3rKJ5CWE8FxVjZ41Fj+M4WshqRc3/i+3eydIC+1pyEnTS/rf/V9OuRtkhEUHs
	fMhvsIXk0Eor94o7w2OgUpWwKGjrABCZCIuO20Aufl4zZdieRQ+0sV5hrRVRrbTGh1jSi
X-Received: by 2002:a17:90b:4a4f:b0:3ac:fe93:a731 with SMTP id 98e67ed59e1d1-3ae5822102cmr1339726a91.56.1793180551322;
        Wed, 28 Oct 2026 02:42:31 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a93b3f5sm2242377a91.5.2026.10.28.02.42.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 02:42:30 -0700 (PDT)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.de,
	perex@perex.cz,
	anton.yakovlev@opensynergy.com,
	mst@redhat.com,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	Joonho Lee <mynameisjune111@gmail.com>
Subject: [PATCH v7 14/16] docs: describe virtio-sound capture options
Date: Wed, 28 Oct 2026 18:41:30 +0900
Message-ID: <20261028094132.20364-15-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261028094132.20364-1-mynameisjune111@gmail.com>
References: <20261028094132.20364-1-mynameisjune111@gmail.com>
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

Document the five opt-in capture module parameters introduced by this
series. All default to false. Describe the startup-empty, short-payload,
packed-status and pause-restart compatibility behavior alongside staging,
and require validation with the target device.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 30 +++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index e75344f..6c7b1b3 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -8328,6 +8328,36 @@ Kernel parameters
 			brightness level.
 			default: 1
 
+	virtio_snd.capture_allow_empty= [HW,SOUND]
+			Retry a bounded number of empty startup capture replies.
+			Format: <bool>
+			Default: false. Compatibility option for devices that
+			require staged capture; validate with the target device.
+
+	virtio_snd.capture_allow_short= [HW,SOUND]
+			Accept non-empty, frame-aligned short capture replies.
+			Format: <bool>
+			Default: false. Compatibility option for devices that
+			require staged capture; validate with the target device.
+
+	virtio_snd.capture_packed_status= [HW,SOUND]
+			Read status immediately after the returned capture data.
+			Format: <bool>
+			Default: false. Compatibility option for devices that
+			require staged capture; validate with the target device.
+
+	virtio_snd.capture_pause_restart= [HW,SOUND]
+			Release and reprepare capture streams across pause.
+			Format: <bool>
+			Default: false. Compatibility option for devices that
+			require staged capture; validate with the target device.
+
+	virtio_snd.capture_staging= [HW,SOUND]
+			Use request-owned buffers for capture data.
+			Format: <bool>
+			Default: false. Compatibility option for devices that
+			require staged capture; validate with the target device.
+
 	virtio_mmio.device=
 			[VMMIO] Memory mapped virtio (platform) device.
 
