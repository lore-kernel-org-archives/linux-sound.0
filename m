Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C903F6C24
	for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 08:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784017784; cv=none; b=f3P0Z3G7OFvTbOGeqweZnfsODo3ocs0NrgTLJig4go6X4EBJzutfp1L/erFuQC/82WaZmhvhPsfEdj/6vGYlIZfr5s8iVP0MWbp6PxqqXI8AvTLxz6JfxDdFazCL7p1x3gQo8KnUFVm0f428BUD+bI3+bkOc0BsQyvNe42+7MB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784017784; c=relaxed/simple;
	bh=hzylLn5H+WpEY/l1g0SAe/A9fRmocelN5I+yIjF5SWQ=;
	h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:Cc:To; b=KXngzl12l+J9/YWgOtqziox/UyzaZMfMl58NO19VwN7ImXLi71Mi8qfle7FvzVQl1OyXZuMPDC0RHc1fZr7087Yfk22zqkDFE0yMDmJfc+ktOKOy7+NqZ9ml6OHsnr4G4JihWip7Z578Fqi/OS02s13I6QvdyQPH+dNul570S4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=doyensec.com; spf=pass smtp.mailfrom=doyensec.com; dkim=pass (2048-bit key) header.d=doyensec.com header.i=@doyensec.com header.b=IE024rIJ; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=doyensec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=doyensec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=doyensec.com header.i=@doyensec.com header.b="IE024rIJ"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c15ba5b151dso87260166b.3
        for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 01:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=doyensec.com; s=google; t=1784017775; x=1784622575; darn=vger.kernel.org;
        h=to:cc:date:message-id:subject:mime-version
         :content-transfer-encoding:content-type:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O5qcr43MYyk8Rdnv8NoBGU4eaKU8JCviUqurIFf1yFI=;
        b=IE024rIJCnngw38LO5pE0E1fEGN7sNXA3gCpnC0QpD9CDskpikHQltr0JVDpHRHxUb
         ZQA1iKUMd9SnU/DzSalasKvzOw7w9rFTuiVK0ynPiUer8wGBg1YZCKc/13CbK8Wl9NR4
         APpxHegL+kVXM9Izotehcm37zLouaaRBagR8C2HJMO/vTseKbEeBf7i1NKLZJ3mKY2OK
         j/XL3X3lvFMNdH8QKKVDB4tSlqzm3I/W9EpMfQ5HOXTbPHK+4EojSm0OZFHpYXHU/2OH
         OlyjaRbmhk/EUzovDqoPxMNlU/y9ikNwPlQPTqEdbe+5LKIENXw7Mt1q6/MmoBZTV7xW
         9lyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784017775; x=1784622575;
        h=to:cc:date:message-id:subject:mime-version
         :content-transfer-encoding:content-type:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O5qcr43MYyk8Rdnv8NoBGU4eaKU8JCviUqurIFf1yFI=;
        b=YQJO4ksYGxm74AzqwWMGqadFWYBL0wL817D4RV/TLGuNJ6bpQrrMdWVahLGjXv+kR6
         NyhElMMEhkVSZM+Uqtk8pWcAA12rTytKHAifVEcOpUAl40Qp8/C0Kpi9jSwLU3PgxdXu
         dpBRr2B8vKpzDVLY6zQq2P9OR2SJak2+vG3wk0DKqnUru+xXEyrAANf8PdEuNDE49jDK
         5lElsMrJdjKH15bQzN5asXqgHRzO/8x+Lr6kdaOifVIVN1NBMBxodNA21qmaVRxAu/i2
         ZODMElxAFDynDhNsCyaYmHzbHF3E9uIpg2Qt1UCNa05xVpKiPOIR7S9pKSuhMHuH8Sjk
         ZZGw==
X-Gm-Message-State: AOJu0YzQuRZXHHzmr9wy5meIdCU/wUCrNZXme4CPqOcWRcy92oCXK8Nh
	Sqty93oW0y9k8+nSEgWCzk+HpsnmNS84T7HGKlz06fV/nXmWv03d/W0eUVFNhgDAi0EqI7nku1x
	sBmNLuI/fSQ==
X-Gm-Gg: AfdE7cmfHxwO5bTZlgs01Jn8KR8g/ESdoLogIhWKASHWMyK4RaazHZPaPp1IGEcoS3e
	qxFn0w5W+rKB/Fi2/r6YpSPgx0WeZJlpifMsoymZbM5LyzD0Oy3ykzZVWT1HABnPou9vEnZ+JlM
	DJT13xEnWKn3vpAEOHB7HtQGY5el/VEvOc7Bry4QY+gEC9jwZ6JqoPpUmnBfXzXTFw5XbTZkXaW
	HOp/F+OQ0LTCi3uHmiAFxLtb3d47UGcQ6k9bC7MqXwNSw5eEXCcNO5aoCguAM2fb1o7+jpuD30c
	foBp0iW33//pyfS4od3EDKOjDdDXk9uYQ0/rFgNvLgP9aXPB+raBptzXmev1KlKhtfh/tBaskD0
	JcVnqCCOEbgyuftxCCLWS4bHB/SH7S6eptKI8JQnH5xHY/k19wciS/F7QFFYByCSxIh/AmLwoFm
	rFxSQA6OshuWhMmLszEYP+KDwK4LeyUGrV+hT6N4Trcj4IencdeWjCZ9s804giPfvFiq203gBaJ
	5I/l6bIfxb/2t5wJuSSko7OyPdyddeXysaWjWqcJoxhcU0l5g2q4xpx8N2RCa3lgUBMxw3X+5xo
	UaA=
X-Received: by 2002:a17:906:f20f:b0:c16:139f:b803 with SMTP id a640c23a62f3a-c161f3dd4demr412435366b.43.1784017775273;
        Tue, 14 Jul 2026 01:29:35 -0700 (PDT)
Received: from smtpclient.apple (83.10.38.128.ipv4.supernova.orange.pl. [83.10.38.128])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15f7137225sm628321466b.53.2026.07.14.01.29.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 14 Jul 2026 01:29:34 -0700 (PDT)
From: Norbert Szetei <norbert@doyensec.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.4\))
Subject: [PATCH] ALSA: seq: close a re-opened queue timer in the destructor
Message-Id: <422FDB81-2A68-47C7-A22D-2D3301E2E86D@doyensec.com>
Date: Tue, 14 Jul 2026 10:29:23 +0200
Cc: linux-kernel@vger.kernel.org,
 tiwai@suse.de,
 perex@perex.cz
To: linux-sound@vger.kernel.org
X-Mailer: Apple Mail (2.3826.700.81.1.4)

queue_delete() closes the queue timer, then frees it. =
snd_seq_timer_close()
clears q->timer->timeri. snd_use_lock_sync() then drains borrowers, and
snd_seq_timer_delete() frees q->timer.

A borrower can re-open the timer inside that window. A SET_QUEUE_CLIENT
that took a queueptr() use_lock reference before the queue was unlinked
runs snd_seq_timer_open() after the close. Open refuses re-open only =
while
timeri is set, and the close just cleared it, so it re-opens timeri.

snd_seq_timer_delete() does not close that instance. Its =
snd_seq_timer_stop()
is a no-op, because running was cleared first. So it frees q->timer with =
the
instance still live. The queue is freed next.

The instance stays on the global timer with callback_data pointing at =
the
freed queue. A non-owner START on the unlocked queue arms it. The next =
tick
derefs the freed queue in snd_seq_timer_interrupt().

Reachable by an unprivileged user with access to /dev/snd/seq. No CAP =
and
no queue ownership required.

Close any lingering instance in the destructor. There, ->timeri can no
longer change: the queue is unlinked and all use_lock borrowers have
drained, so no snd_seq_queue_use() can re-open it. Close it before =
clearing
q->timer. snd_timer_close() waits for any in-flight =
snd_seq_timer_interrupt()
to finish, and that callback still reads q->timer (via =
snd_seq_check_queue()),
so q->timer must stay valid until it drains.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Norbert Szetei <norbert@doyensec.com>
---
 sound/core/seq/seq_timer.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/sound/core/seq/seq_timer.c b/sound/core/seq/seq_timer.c
index 4cd7211ccf48..419288eec4bb 100644
--- a/sound/core/seq/seq_timer.c
+++ b/sound/core/seq/seq_timer.c
@@ -61,12 +61,23 @@ struct snd_seq_timer *snd_seq_timer_new(void)
 void snd_seq_timer_delete(struct snd_seq_timer **tmr)
 {
 	struct snd_seq_timer *t =3D *tmr;
-	*tmr =3D NULL;
+	struct snd_timer_instance *ti;
=20
 	if (t =3D=3D NULL) {
 		pr_debug("ALSA: seq: snd_seq_timer_delete() called with =
NULL timer\n");
 		return;
 	}
+
+	scoped_guard(spinlock_irq, &t->lock) {
+		ti =3D t->timeri;
+		t->timeri =3D NULL;
+	}
+	if (ti) {
+		snd_timer_close(ti);
+		snd_timer_instance_free(ti);
+	}
+
+	*tmr =3D NULL;
 	t->running =3D 0;
=20
 	/* reset time */
--=20
2.55.0=
