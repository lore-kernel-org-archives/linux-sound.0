Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF74390991
	for <linux-sound@vger.kernel.org>; Mon, 18 May 2026 19:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779133236; cv=none; b=b8NDGWWAu/io7HHGosXXTMHBMsvn+1GEY0ZtHhZM5djfUZM8S4gSwZyWqwCuTfSBf46xcnPjtnvUI6Tc0pYUZaS2Pn5/O80Hywy+jMbTbKHCCdJRYI3/Rt7h6Y9ZVDx1ksrYYbMJI79PmDry9bCHs2YMMg2P9Zfl0Qfdc6ZQyFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779133236; c=relaxed/simple;
	bh=OvkOHU1s6rxi6bmBlqrdaePC7iDQtRImHoWamAQ2Fk8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kImbaR6RKGIYuXL076iyflRx4ZGrz/M5QTwS0WMLdomKue1t98bgPOCxqQ+uMnBOz7X3LSZtEFP30nEZAojCohNGy+PkMC2xvMEDTsNcHqs/eJ0PKEgIQeKIC32QOYvHuGhHr75TqiVUOBYXiPMlHCQk1k3CFz8uSnWWNuXdLCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HPRMotCv; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HPRMotCv"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c70fb6aa323so1062651a12.3
        for <linux-sound@vger.kernel.org>; Mon, 18 May 2026 12:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779133232; x=1779738032; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rNNDtnW3u1lf/429513OlTaYgvxVqJNtfeBcvswLKUo=;
        b=HPRMotCvVLR9AtJwIClryfMpXb7o/bEOSgD75pGxdxeJNAJ8S4hqd84xVAl7vqUyCu
         Zl0mxcw7JB0oph0T289/d/DR1xIwE4Au2Rvoyt+AL7lDJauxhZ81SWJb6U94vy4uGlWo
         AFRu8Bbf5vMQJmVy5M3g8VctESqRnl+4rKzVX0s+5Gtb+LDYzj0bnvybZ6HPW821pkdU
         EZbaJ9G3IJQbe3okBOd+X0skDzk/WsG9uq66l7x5BySU7YcBbqlQE/rpOQIeQNYpTWSU
         DTudIpIIryQ0E2oL6rW9o+jkGqB9NhX1u2CpJLpl7oZNRfUle0kfvksziofWDSqZJMPN
         FgMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779133232; x=1779738032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rNNDtnW3u1lf/429513OlTaYgvxVqJNtfeBcvswLKUo=;
        b=UJLT6DplrrT4t8FaFjk3USVumKyayY+q+yBpjkV5JyIT6z8op+x4x4YxrUrGREpQJH
         eKpTpJCcsHQvC2ezE2xfnyx55/NRqUZvlcMOXXjlPMl21nQvbKY44+RCEbPryihEx5BW
         sjJd/qfx9Uc5zCt9NtzkC56ZegY7vrvsCA3LHsKgeVKxT3Y0EQpElh2Rc+4yY6wdP0YX
         Lzr3LRZNaztwg8c1bxUU9Mi3VrqgiADci6bRLmJ1cB0rL1Rh0fzVl9FGU7OmfUUittYe
         uRyMQiQPh5XMTp+1gg1Ff5YebVGt7OQqUOact8tyHyxMXZ65tjkYX5SGNRbRTEK7qfRK
         4zzw==
X-Gm-Message-State: AOJu0YyndWk7eJ9QQRFlD85McqnVUf9VDAoV4A/jEZlXfWVEDDrTJYF5
	IbzkLuZmiceR2L+H/qTA6DvFyStjk2fC+qzHLGxDR3YERCYyIehOh0WDhGfCOQ==
X-Gm-Gg: Acq92OH2RFfCXXuWsu8XLUWoBzVvv04WRpThIF6TjAYfvbhAFTwmEwfKi4qTMO1CqIR
	UER3pJaqWhkMszMzxaeSUMrK2gg/1OMuxjneycyhl/ExfUUnmqEqHPLqWGM9zT7qspGCl/DIKbj
	DIoUhFA326PNNRvLxlihbab23f5QRTNTdhcSgR4UOhwVMTCoaFfgh2+KXsJR3w/trKhx9fA8kok
	uFREYsnTAZMG3fs6AqoUAo63g+8BpnYZk1DIv304M36/gQv0CB6BiZ7A0KyWloRxDcheH+WxGDp
	EjpdkdPNJRXR3o4xnKuzB8s5H5ha3pF27ZMGZpaYpFpDoMos9GQ7qiDeiTDZYtYkIX7zV8z81CR
	p9wGZSyT7bZflGribMe2tZzSrjVBf6U95PFjtlU4GXtpIJi6mpNRsrcWTY0LRY29OMFTrK3rZX9
	++KojZGK0NkGtYg4TOrYluMZfKhlxtAYameQ8Wzzgw5GY4mNU1
X-Received: by 2002:a05:6a20:244f:b0:3a3:1071:89f0 with SMTP id adf61e73a8af0-3b22e65c034mr19513563637.2.1779133231982;
        Mon, 18 May 2026 12:40:31 -0700 (PDT)
Received: from csl-conti-dell7858.ntu.edu.sg ([155.69.195.57])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb07d2fesm14237808a12.9.2026.05.18.12.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 12:40:31 -0700 (PDT)
From: Maoyi Xie <maoyixie.tju@gmail.com>
To: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ALSA: seq: avoid past-the-end iterator in snd_seq_create_port()
Date: Tue, 19 May 2026 03:40:23 +0800
Message-Id: <20260518194023.1667857-3-maoyixie.tju@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260518194023.1667857-1-maoyixie.tju@gmail.com>
References: <87o6ic4izy.wl-tiwai@suse.de>
 <20260518194023.1667857-1-maoyixie.tju@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

snd_seq_create_port() walks client->ports_list_head looking for
the ordered insertion point and on loop fall-through passes
&p->list to list_add_tail():

    list_for_each_entry(p, &client->ports_list_head, list) {
            if (p->addr.port == port) {
                    kfree(new_port);
                    return -EBUSY;
            }
            if (p->addr.port > num)
                    break;
            ...
    }
    list_add_tail(&new_port->list, &p->list);

When the loop walks all entries without break (e.g., the new
port sorts last), p is past-the-end. &p->list aliases
&client->ports_list_head (the list head) via container_of offset
cancellation, so the insert lands at the list tail. That is the
intended behaviour, but the access is undefined per C11 even
though it works in practice.

Track an explicit insert_before pointer initialised to the list
head and overwritten to &p->list only when the loop breaks
early. The observable behaviour is unchanged.

Fixes: 9244b2c3079f ("[ALSA] alsa core: convert to list_for_each_entry*")
Signed-off-by: Maoyi Xie <maoyixie.tju@gmail.com>
---
 sound/core/seq/seq_ports.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

--- a/sound/core/seq/seq_ports.c	2026-05-18 19:17:08.278971518 +0800
+++ b/sound/core/seq/seq_ports.c	2026-05-18 19:18:44.006234339 +0800
@@ -144,18 +144,21 @@
 	num = max(port, 0);
 	guard(mutex)(&client->ports_mutex);
 	guard(write_lock_irq)(&client->ports_lock);
+	struct list_head *insert_before = &client->ports_list_head;
 	list_for_each_entry(p, &client->ports_list_head, list) {
 		if (p->addr.port == port) {
 			kfree(new_port);
 			return -EBUSY;
 		}
-		if (p->addr.port > num)
+		if (p->addr.port > num) {
+			insert_before = &p->list;
 			break;
+		}
 		if (port < 0) /* auto-probe mode */
 			num = p->addr.port + 1;
 	}
 	/* insert the new port */
-	list_add_tail(&new_port->list, &p->list);
+	list_add_tail(&new_port->list, insert_before);
 	client->num_ports++;
 	new_port->addr.port = num;	/* store the port number in the port */
 	sprintf(new_port->name, "port-%d", num);
-- 
2.34.1
