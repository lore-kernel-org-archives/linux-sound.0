Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F35593B71C5
	for <linux-sound@vger.kernel.org>; Mon, 20 Jul 2026 07:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784531672; cv=none; b=haxZ1AVSQ477FeAD9fO6pJwLfe7tnhn+IM1QbfEYAwBt73ocJBu+HEDwsdTA3Og72j3oF6JW7D4uZzH+owXB9grOV5tqHTUp7MLlGZyvEU2A1kMyq07KIpa2ZTjgJqZF01WKMj9sQloHWpnkqzvYdN0cOBinm/c22Rf8b03T7i8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784531672; c=relaxed/simple;
	bh=VjA1FIKhgjCtwMBOccoujN3/BZcDsX6IJ7YmyIXhUbQ=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=gAVl/rT88BClAkGHKpvRiGaNtgCxh4mqxhnAZNChc529xSMDPbpFXhvnVl+neWD4s+wPkwPrrmbaowGlDFo1+vN2Zn2JSg6m0pmjxNc7B/azgqAUUWBq3k9dvFueQxzOH2qhB95WHi4JZdqXK5BerQG6TCMx06bpGjkAeuxNO8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=doyensec.com; spf=pass smtp.mailfrom=doyensec.com; dkim=pass (2048-bit key) header.d=doyensec.com header.i=@doyensec.com header.b=Ul6mEPsd; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=doyensec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=doyensec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=doyensec.com header.i=@doyensec.com header.b="Ul6mEPsd"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c15d111ca99so1008382766b.0
        for <linux-sound@vger.kernel.org>; Mon, 20 Jul 2026 00:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=doyensec.com; s=google; t=1784531666; x=1785136466; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NeZD4ND3M0jkTrNWKT4lBd0LRKrWJlRu5YRE32UTcVk=;
        b=Ul6mEPsdxqUNuLXdOzbXOtjOBC4T48shJkMP6WlwzAsT9hole41CAfG5rPnVuUuMCx
         JWZY8VfZCXIWRLFZfih00AVHCTeT63a4cLxludqBuGUMtviDxte3tqrZlQcY/dHTrrE3
         do34QxTv9+DpwpwNESriBQsu3IKSzrihrXg6Q6v94kF4sjVZYFL2iWskm95ijFrf0kY7
         pckuwk12a+k3xX7OsFlboWKFD6JJCT0pRz6yvlyPI399p5a9aRBabyEIulZGNQR91Xd+
         Zvw2rJm6pBoKgn5K1ni0cElGfeXxxY1lC1CfbiKRRTMlW47RJmGe3KGBwTQMsuaXqeV7
         /EHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784531666; x=1785136466;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NeZD4ND3M0jkTrNWKT4lBd0LRKrWJlRu5YRE32UTcVk=;
        b=Me1LvyUxxTKa73GdK9nmsC51OIR//xNL6C1zC/g6Q11nYBCikQAFM14AT6XmAl/XlS
         JKMTtGzvpM1SfuvocEQO0xRkmam1UQgLVk8RtoMCl+wPty7Bg/nQVhPKEhbHDPDhAkLi
         uMV+W9JyFdxMprjUl5WPBhiZDxzU6DzC3Mfu9LJVpkMYYC0O5Ms10lAGBJ+a7yXLgH6e
         PRZthcndiJzdc3vRCZUrwet3VqmjvWd7bwOuxuUS1DFoLbAsvOMba+GW1JItktcIv/B+
         g8sEj2jpUN5Rk97VR8tKSNTrxCCan4o+i2UqtRCrhj3S/BT5YFCvtdLIjYivatr9DkIX
         DAmQ==
X-Gm-Message-State: AOJu0YylA61W3Sihw9SZruFLwvqtaYajDY6wGJnNRGOB4lm8hJxCuAQa
	y6Spx4p6WpPFmPsQxZn8qgcTjN37O0Mv1Of4AEN17VIzjQdxMDp+OZfibWZ6qPqzawbe7yrly/K
	Qk0e5DgXnmQ==
X-Gm-Gg: AfdE7cl/d4quw0uvSrOiUU3oDfCnWOfF6eY1cHraMrlGc05AxrnkPEZ3n5SY/205oar
	nPrP/U2yQ8a6pPNmxaWWzXk+uKTyNRYL4xk3Af8lVCuNyG4HYUtFg5ZDEqn1EGh/Tk7CTxPZqly
	Iv7P65zaFtH8T6qkY5cY9q0t+nBv1EtEMuPfQQt6rfKZziiw0t8FxunQHuYIDu6utCx96+h01rB
	gUCtQWFfo285M6aw8V9/PZbDnEd0fna0JRivSrxvOqrRxBR8Iv27g+LKRll5IVNhsgLz5kd1jUF
	2FY7PfnLwQ9ZExPo5SN61mlJY9697y87gXO5hEW5I9kpUcqcJLakA4sS0IaR/J9ZWSYVIHS5lti
	NsCXRbZTCYKAgYsz261sexoTuXeMXfNHoIepa3d5bo2+aOSO4yHzw7/iyRNpkepyeOFkBhWTcRH
	vxQcw/9op4jL4PlauIgSK13cb8MK7iUzC9XX1CWW+mK4X21y6RZgwdjcROruGexJTxLLMkLoJEl
	ULqGKvalwavbY3qpjiXt+SqUedqJ2oG6T3kHGUfpIIVNP8=
X-Received: by 2002:a17:907:9704:b0:bb7:eb68:514e with SMTP id a640c23a62f3a-c16b477c696mr482401366b.36.1784531665797;
        Mon, 20 Jul 2026 00:14:25 -0700 (PDT)
Received: from smtpclient.apple (83.10.38.128.ipv4.supernova.orange.pl. [83.10.38.128])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69e6ffe104esm4207682a12.22.2026.07.20.00.14.23
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 Jul 2026 00:14:24 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.4\))
Subject: [PATCH 2/2] ALSA: timer: drain a slave's callback before its master
 detaches it
From: Norbert Szetei <norbert@doyensec.com>
In-Reply-To: <6F9B6501-8E65-4265-B02C-7EFB240D1664@doyensec.com>
Date: Mon, 20 Jul 2026 09:14:12 +0200
Cc: linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.de>
Content-Transfer-Encoding: quoted-printable
Message-Id: <D26598EB-DBF7-4D76-9F71-8E4BD59822D4@doyensec.com>
References: <6F9B6501-8E65-4265-B02C-7EFB240D1664@doyensec.com>
To: linux-sound@vger.kernel.org
X-Mailer: Apple Mail (2.3826.700.81.1.4)

snd_timer_close_locked() drains the closing instance's own in-flight
callback (IFLG_CALLBACK) before freeing it, but not its slaves'. When a
master instance is closed, remove_slave_links() clears each slave's
->timer; the slave's own close then reads timer =3D=3D NULL and takes =
the
branch that skips the drain entirely (snd_timer_stop_slave() also no-ops
on a NULL timer). So a slave whose callback is still running when the
master is closed is freed underneath the live callback, leading to
use-after-free.

Drain the slaves too before remove_slave_links() severs them.
snd_timer_stop() has already taken this instance off the active list, so
no new slave callback can be queued. Take the slaves off the ack list so
a pending one can't fire either, then wait for any that is already in
flight.

Fixes: 37745918e0e7 ("ALSA: timer: Introduce virtual userspace-driven =
timers")
Cc: <stable@vger.kernel.org>
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Norbert Szetei <norbert@doyensec.com>
---
 sound/core/timer.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/sound/core/timer.c b/sound/core/timer.c
--- a/sound/core/timer.c
+++ b/sound/core/timer.c
@@ -489,10 +489,20 @@ static void snd_timer_close_locked(struct =
snd_timer_instance *timeri,
 	snd_timer_stop(timeri);

 	if (timer) {
+		struct snd_timer_instance *slave;
+		bool busy;
+
 		timer->num_instances--;
-		/* wait, until the active callback is finished */
+		/* unqueue then drain the slaves' callbacks before =
remove_slave_links() severs them */
 		spin_lock_irq(&timer->lock);
-		while (timeri->flags & SNDRV_TIMER_IFLG_CALLBACK) {
+		list_for_each_entry(slave, &timeri->slave_list_head, =
open_list)
+			list_del_init(&slave->ack_list);
+		for (;;) {
+			busy =3D timeri->flags & =
SNDRV_TIMER_IFLG_CALLBACK;
+			list_for_each_entry(slave, =
&timeri->slave_list_head, open_list)
+				busy |=3D slave->flags & =
SNDRV_TIMER_IFLG_CALLBACK;
+			if (!busy)
+				break;
 			spin_unlock_irq(&timer->lock);
 			udelay(10);
 			spin_lock_irq(&timer->lock);
 		}
 		spin_unlock_irq(&timer->lock);

 		remove_slave_links(timeri, timer);
--
2.55.0=
