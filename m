Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=23.251.234.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795331509;
	b=UdYYg60+0hv7HO5sK8Du903NItXeGOqPLnbiov9nj5+swyN3//rcEK7WHlib1YmxJBGG
	 DdL7Ld5UP4eZl1wZ4sbpe5f+V+4yvvRMnrTwYms4oVOQBPTz4yJ+fQNaqyNkK1KONg/7m
	 u5AnITBweLsaZAXrR+4WcgVAuSUA/qWdOXi9NyWrn03C2vyc3djl+hbvwOlLhyNZLufev
	 Dwg+IceYnX6JYF9C+VNiMnC5VXjgOj+5Yzq51fyKwDXYeCfEVqP3bggxGdoCoLj243pPb
	 WN8t6NDCAJWhvsKK7MZbSPfHuUS6u5vdIji8s08nHseNLNRKRfh+VLk8/FiR9HOv45Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795331509;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:X-Mailer:From:To:Cc:
	 Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:
	 Content-Type:Feedback-ID:X-SES-Outgoing;
	bh=eJG1RWhQG7NS8RqaA5nBBKHSLMeEZTyXUq7B4ujKkRY=;
	b=dS1HMkm2Fl8CKJzzeVOFYKB4N7tkfNqJ5W4FWgz4s3J2RrI0C7Ws8HdRsqcE0B5xLk3X
	 mML/MR3p02IhaRngUKv7YVNxR4kgCVzn7hmffgQHxltzYcAwiaiUt+euCI5Gz9wG++Wcx
	 xU6IM9qW8kIG4glF48ZumRg5VvtCZahley2+e68XQSuYwxbLFOZqGDXGoT4LQn+hDCyGE
	 VgSJGVlhoeEDksZdjUY0TNZYirwa82PI2mBbLYKK92oraSUuBhiJ3NYirq9TGGSuiZXHb
	 s8t8L3YDVfAK3Nduv5lYgfB4SkxIYz44k2PdS127Qei4mehvG7WuAo0aJniS76Nc6Pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fqwqf.xyz;
	spf=pass smtp.mailfrom=send.fqwqf.xyz;
	dkim=pass header.d=fqwqf.xyz header.i=@fqwqf.xyz header.a=rsa-sha256 header.s=resend header.b=mYo7S8ot;
	dkim=pass header.d=amazonses.com header.i=@amazonses.com header.a=rsa-sha256 header.s=zh4gjftm6etwoq6afzugpky45synznly header.b=lCYRW4Vz;
	arc=none smtp.remote-ip=23.251.234.53
Received: from e234-53.smtp-out.ap-northeast-1.amazonses.com (e234-53.smtp-out.ap-northeast-1.amazonses.com [23.251.234.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0AB606A32A;
	Sun, 22 Nov 2026 07:11:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD0AB606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fqwqf.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=send.fqwqf.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fqwqf.xyz header.i=@fqwqf.xyz header.a=rsa-sha256 header.s=resend header.b=mYo7S8ot;
	dkim=pass (1024-bit key, unprotected) header.d=amazonses.com header.i=@amazonses.com header.a=rsa-sha256 header.s=zh4gjftm6etwoq6afzugpky45synznly header.b=lCYRW4Vz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple; s=resend;
	d=fqwqf.xyz; t=1795331507;
	h=From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type;
	bh=vVhzXuccvxigB1urtDltA4vZjbPesvRjPQ00ukwOVRM=;
	b=mYo7S8otmOemYa4xaxgh+lGTEKQV0VU0avSp4TZ4PPn/tAnWtupRFMrnqayAJ0lq
	xjVaMxgJ0sm47evofui2XRNBKYljAmcxXTFx11mQUwAxl5xqciCHzqVuSJ7uVk6AZOr
	/jHs3veXXFgxuJHs9XQSBUWMIq6U9l0mf209MG9c=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=zh4gjftm6etwoq6afzugpky45synznly; d=amazonses.com; t=1795331507;
	h=From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type:Feedback-ID;
	bh=vVhzXuccvxigB1urtDltA4vZjbPesvRjPQ00ukwOVRM=;
	b=lCYRW4VzARxk+Y2ph1aut6LqXsKvyi+B8RQ9EL+2+k9MS8DgHIiRnBqfwR+vPW2E
	eqJlrVpAj4y8zfYcbmsBhI3ddX0w0AztMYIY3AnX6jxymaUZxQQ/W3tcUKEK85MJyZP
	S4vGLIQVrFLipmEbuSQHKnruSbGX9+7KkDLxZBcE=
X-Mailer: git-send-email 2.53.0
From: Jizhou Tong <fqwqf@fqwqf.xyz>
To: vkoul@kernel.org, yung-chuan.liao@linux.intel.com
Cc: pierre-louis.bossart@linux.dev, rf@opensource.cirrus.com, 
	ckeepax@opensource.cirrus.com, srini@kernel.org, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH] soundwire: protect the slave IRQ mapping during alert
 dispatch
Message-ID: <010601a20218c3b5-523b454f-b8b0-4259-9b20-524c1d435465-000000@ap-northeast-1.amazonses.com>
Content-Transfer-Encoding: quoted-printable
Date: Sun, 22 Nov 2026 07:11:47 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Feedback-ID: :1.ap-northeast-1.6BGMgStFQE7EJYq5syaCRzdneEHVt/+DAaGDrqUmDs9QLO4/SllUBZ3fHvnZ8rcAX/3IjUyTRgi5JFZsWrikFHwlPJqCkqEMlxDFM4JXh+ycxH/J5Tudg5bGdz6h4331g1L1EFsGR8kuYNfGLsrxz4Nym4YXoPcZxeVkrHry4Zx21n8vEVLEjc7s+OCM8PU9:1.ap-northeast-1.DTXDV/V9GPBWozcllKo8innbNB2qs2O/3F8XZSzd9ZM=:AmazonSES
X-SES-Outgoing: 2026.11.22-23.251.234.53

sdw_irq_create_mapping() publishes slave->irq before it registers the
devres action. If devm_add_action_or_reset() fails, it disposes the
mapping but leaves its number in slave->irq. sdw_bus_probe() then
calls the peripheral driver's probe() with that stale number.

Clearing the number on release alone also leaves a window for the alert
handler to pick up the old IRQ before its mapping is disposed. Keep the
mapping private until cleanup is registered. On teardown, take a
per-slave write lock to drain active dispatches and clear the number
before disposing the mapping. Hold the read side across the nested IRQ
handler, which runs in thread context and can sleep.

The lock is independent of sdw_dev_lock so nested handlers continue to
run outside the peripheral callback lock. Peripherals that can operate
without an IRQ can still probe if mapping setup fails. Return early on
a zero mapping so there is no cleanup action to register for IRQ 0.

Fixes: a5fef9baa87f ("soundwire: bus: Move irq mapping cleanup into =
devres")
Link: https://lore.kernel.org/r/d7761226-31b0-4d0f-bc56-9c4d5e42bf=
ba@opensource.cirrus.com
Signed-off-by: Jizhou Tong <fqwqf@fqwqf.xyz>
---
This came up while moving WCD938x to SoundWire domain IRQs. Richard
previously pointed out the stale IRQ on release.

The rwsem lets =
overlapping alerts run and keeps per-slave state small.
Reusing sdw_dev_lock would bring it into nested handlers. A per-slave
SRCU domain would also have to drain readers during teardown. On this
base, mapping setup precedes the peripheral probe and sdw_dev_lock.
Unbind still holds the device mutex while draining readers. Do any
domain IRQ handlers depend on work that needs that same device mutex?

Built soundwire-bus.o with ARCH=3Darm64 W=3D1. In a four-vCPU arm64 guest
with PROVE_LOCKING and DEBUG_ATOMIC_SLEEP enabled, an emulated peripheral
ran three rounds of 200 driver-core bind/unbind cycles under concurrent
alert dispatch. Removal started with an active handler in 514 of the 600
cycles. To exercise lock ordering against sdw_dev_lock, the test handler
acquired that lock and slept while holding it. Lockdep remained enabled
and reported no warnings in any run.
The physical codec and runtime PM =
paths still need coverage.

 drivers/soundwire/bus.c       |  4 ++--
 drivers/soundwire/irq.c       | 36 +++++++++++++++++++++++++++++++----
 drivers/soundwire/irq.h       |  5 +++++
 drivers/soundwire/slave.c     | =
 1 +
 include/linux/soundwire/sdw.h |  3 +++
 5 files changed, 43 =
insertions(+), 6 deletions(-)

diff --git a/drivers/soundwire/bus.c =
b/drivers/soundwire/bus.c
index aeaae5a57c89d8af05cadd6fe55d44856600e781..=
0bc0ad9e9934e790c27526ff4c736e8d5a2bebaf 100644
--- a/drivers/soundwire/bus=
.c
+++ b/drivers/soundwire/bus.c
@@ -1781,8 +1781,8 @@ static int =
sdw_handle_slave_alerts(struct sdw_slave *slave)
=20
 		/* Update the Slave driver */
 		if (slave_notify) {
-			if (slave->prop.use_domain_irq && slave->irq)
-				=
handle_nested_irq(slave->irq);
+			if (slave->prop.use_domain_irq)
+				sdw_irq_handle(slave);
=20
 			mutex_lock(&slave->sdw_dev_lock);
=20
diff --git a/drivers/soundwire/irq.c b/drivers/soundwire/irq.c
index f18be37efef8e0ef63bad159cc0d9ebb619a89bf..1f13e1093d94863012fb966b555=
682826f051cb6 100644
--- a/drivers/soundwire/irq.c
+++ =
b/drivers/soundwire/irq.c
@@ -2,10 +2,13 @@
 // Copyright (C) 2023 Cirrus =
Logic, Inc. and
 //                    Cirrus Logic International =
Semiconductor Ltd.
=20
+#include <linux/cleanup.h>
 #include <linux/device.=
h>
 #include <linux/fwnode.h>
+#include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/irqdomain.h>
+#include <linux/rwsem.h>
 #include <linux/soundwire/sdw.h>
 #include "irq.h"
=20
@@ -49,15 +52,40 @@ void sdw_irq_delete(struct =
sdw_bus *bus)
 static void sdw_irq_dispose_mapping(void *data)
 {
 	struct sdw_slave *slave =3D data;
+	unsigned int irq;
=20
-	irq_dispose_mapping(slave->irq);
+	scoped_guard(rwsem_write, =
&slave->irq_lock) {
+		irq =3D slave->irq;
+		slave->irq =3D 0;
+	}
+
+	irq_dispose_mapping(irq);
 }
=20
 void sdw_irq_create_mapping(struct =
sdw_slave *slave)
 {
-	slave->irq =3D irq_create_mapping(slave->bus->domain=
, slave->index);
-	if (!slave->irq)
+	unsigned int irq;
+
+	irq =3D irq_create_mapping(slave->bus->domain, slave->index);
+	if (!irq) {
 		dev_warn(&slave->dev, "Failed to map IRQ\n");
+		return;
+	}
+
+	if (devm_add_action(&slave->dev, sdw_irq_dispose_mapping, slave)) {
+		irq_dispose_mapping(irq);
+		dev_warn(&slave->dev, "Failed to register =
IRQ mapping cleanup\n");
+		return;
+	}
+
+	guard(rwsem_write)(&slave->irq_=
lock);
+	slave->irq =3D irq;
+}
+
+void sdw_irq_handle(struct sdw_slave =
*slave)
+{
+	guard(rwsem_read)(&slave->irq_lock);
=20
-	devm_add_action_or_reset(&slave->dev, sdw_irq_dispose_mapping, slave);
+	if (slave->irq)
+		handle_nested_irq(slave->irq);
 }
diff --git a/drivers/soundwire/irq.h b/drivers/soundwire/irq.h
index 86e2318409dab8b8137df45586029a6312ee61ff..93e949ec10ca37abea6f0fb8f88=
e4f016e83259a 100644
--- a/drivers/soundwire/irq.h
+++ =
b/drivers/soundwire/irq.h
@@ -16,6 +16,7 @@ int sdw_irq_create(struct =
sdw_bus *bus,
 		   struct fwnode_handle *fwnode);
 void =
sdw_irq_delete(struct sdw_bus *bus);
 void sdw_irq_create_mapping(struct =
sdw_slave *slave);
+void sdw_irq_handle(struct sdw_slave *slave);
=20
 #else /* CONFIG_IRQ_DOMAIN */
=20
@@ -33,6 +34,10 @@ static inline void =
sdw_irq_create_mapping(struct sdw_slave *slave)
 {
 }
=20
+static inline void sdw_irq_handle(struct sdw_slave *slave)
+{
+}
+
 #endif /* CONFIG_IRQ_DOMAIN */
=20
 #endif /* __SDW_IRQ_H */
diff --git a/drivers/soundwire/slave.c b/drivers/soundwire/slave.c
index a7d2938b031d0f2d32986e93ffb2bd85e7d73520..ffe21bb04ff70e71af681b26cc4=
75ea65c188c68 100644
--- a/drivers/soundwire/slave.c
+++ b/drivers/soundwire/slave.c
@@ -65,6 +65,7 @@ int sdw_slave_add(struct =
sdw_bus *bus,
 	slave->probed =3D false;
 	slave->first_interrupt_done =3D =
false;
 	mutex_init(&slave->sdw_dev_lock);
+	init_rwsem(&slave->irq_lock);
=20
 	for (i =3D 0; i < SDW_MAX_PORTS; i++)
 		init_completion(&slave->port=
_ready[i]);
diff --git a/include/linux/soundwire/sdw.h =
b/include/linux/soundwire/sdw.h
index f710e5932b4b23c025579b3c8346fe4b5e5f2=
624..d8c8eae7aed67ae02a140656432a561b28876575 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -15,6 +15,7 @@
 #include <linux/lockdep_types.h>
 #include <linux/device-id/sdw.h>
 #include <linux/mutex.h>
+#include <linux/rwsem.h>
 #include <linux/types.h>
 #include <sound/sdca.h>
=20
@@ -643,6 +644,7 @@ struct sdw_slave_ops {
  * @id: MIPI device ID
  * @dev: Linux device
  * @index: internal ID for =
this slave
+ * @irq_lock: protects the IRQ mapping during nested interrupt =
handling
  * @irq: IRQ number
  * @status: Status reported by the Slave
  * @bus: Bus handle
@@ -676,6 +678,7 @@ struct sdw_slave {
 	struct sdw_slave_id id;
 	struct device dev;
 	int index;
+	struct rw_semaphore irq_lock;
 	int irq;
 	enum sdw_slave_status status;
 	struct sdw_bus *bus;

base-commit: afd88e7ad78170040612f608203734156b8a9e=
b1
