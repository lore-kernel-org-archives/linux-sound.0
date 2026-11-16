Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794798250;
	b=RW4SxEX3gMx60zwSOz0JQTWBMBfhSR3eGJ0nc+2qmoUnRepOyfHIHikPuXZCdpHsLGLK
	 XlFoCq/hOuHml+nSGSylUultf8tXH4TmoAUTonIgkjswpNx8zS7oABMBCb6KiGw5LJ621
	 kZiAUWzJff2HR2kTLWD/CCfjsWCt7on18s3kgFmsN6hvp4JktePPYVCOt6vxoZGcHcHqN
	 lsAhWBt8uqnM08VYCkk2YEtuZx38R2x3h7jhXhAcbUIt7f/4RBpaM1M6HU6GUGNcZFCWz
	 DrDIUJrwVvVaGL8vi6+NzoBqZc97lMcXYpCekaCvde8/h/YhH9DLLTf0pdAHipWCoOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794798250;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AkzCjo5n3Xkuc8ZV8uGQAI/qIaPXp6OBSc8iow3aVtc=;
	b=H5/hy2IQI27bNmb4dyftILNQlt86EdgeA3b0mSTeihWDRZ9HehilHOqR5tg2Ul6wJ43h
	 xVfx7IMUGcDzU25ljb8ZWXqPSZ+JRQXZvcZhYt2uNNon6oEM0xhdTFddbzBNC8zfy9DHe
	 YJK4afDhbNKfUGqwsZ1foBWRKDJsj37yyfZFiHLCRMLDZyYUr813BAY8tW1bVGWMdCmnp
	 Du0YE0+wPJjgq97LU4OMyOHO3czQRQMZgtFep0oVINggW0wQJOplUci0tKGnZumnINz7p
	 SZJaS+nfYX9I6Os9YRfPcwhrCWAEjvFaq732EwwrmYZyoern0HeeQwzjmwm0dkbr3fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wGKJJAbk;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD49606A88D
	for <linux-sound@vger.kernel.org>; Mon, 16 Nov 2026 03:04:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFD49606A88D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wGKJJAbk
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-372bdb942dbso2584084eec.1
        for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 19:04:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794798247; x=1795403047; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AkzCjo5n3Xkuc8ZV8uGQAI/qIaPXp6OBSc8iow3aVtc=;
        b=wGKJJAbkmfyjKBC1FQuCbSaaK2GGZ1hUqDKHVwayShZA3ggvo+gETtlvIHP7K7RbEa
         tsI2GWa/cRvA/JG5F7dOYaKGGj1GJoGlgoRAzok/e2fqqyC5H3hHVNOzd2997F5OxMNh
         /r+9mZNT5deGVF0hE/vIbuGM0Oe3CeSRGJ1PAdClkYYvtIGscI02GOfayGnYBx0hPzJ5
         eht7FSEdi96CghKRznZa9HOvbrxhSI6nXuCJyyizg586FVDnnd1kTVm0hWTtjCyM53+M
         PDS+N4MTLcdIAakwr6cIJGUqiFKZJPmPejpxqSBfDX3oEmLxUsYWei3l4vXX8+Z2PmoG
         OlMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794798247; x=1795403047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AkzCjo5n3Xkuc8ZV8uGQAI/qIaPXp6OBSc8iow3aVtc=;
        b=f78W0vANyAc41gY+dTvin3+uRsRoHpvjHJqgLiQbwJq8cYqnWX/XHYxCGjuq7u6v4b
         vceP+uXzY1kFVMO7fB/Ktq+YxBqnOP3emNZX9HZMHGnaOQGMYVWqlmLoIXq27mjj4eDS
         IZsMiNebEONcPsKrVq0nvOIaVdKvFCwc0YSf7DuC8yZiycK8pDX03rdRjvZxDrz5prL4
         4hBMMyFMQFJVKiip0Nm4xQzpnAEuLM72TnLY+NMSFQ/M5/TjwxDLkId+zzA+3nTkVleg
         Goed5WS3j+WcCJiJcxMaQPeTfDj2yJCPssjQrz6NIQWSG4PoZ2S/pDe5yAhDK+ugHz+8
         4Fwg==
X-Forwarded-Encrypted: i=1; AL+hErGKOf7yQt1c4mQDZRpgZXLj2Dz35qNW6AtBvmGzV3s1GlV8X91GrN0KcOuQkKi28pd/3hzTYqxt++jSNw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8FST7uAW/17uw7Ciz3BMCTa9RUGq5NZ2wzFIfoUg0X7GhKd9Ll
	zXSouhZ5VrpO2L5adhqLK+GTA+4NUt4Mb5OIfqXI27Sg9RUvMLcKEBFf
X-Gm-Gg: AYBFou3dXv0ZIOD9O/7ULnqghNK+P3rsGGq8anb4HQZpoBiYkGCBrnfzC57lX5g96cE
	SPVFPL6XDIM64xB3D1WwpAOR2NjW79YuplzNtUxSyZJPAnc4RlPljuLmeFnXh4mhaU66l+rv59j
	dUwtURbRhzuNLZPNqaWqtGnEhXD/9UJVyppOygBVAUAC1MTw/zJO8SXYB8i36wQ6Mew23YZ7Icp
	sBmJKA4jXZnkaMMp0RBNFKtj8vK8pTEUJuJQSzHLbCTP1NTzU9nEP2DYZYo81Dg0kFcRwlQXsnh
	/in/GGHaqP7yY2oXtAOPKHSbInJTYRoFNOvmnDuN0l3fv4ADX/+EtHYbEh4aBkvC3Ii/LbVuZCc
	luLbXrC+eg9bVHJDJ2BZGtESPrNc+bsUVDtokC5DblaKOBNJHhC4/i/1LA2WLTwYgTwtNUUs7dI
	gk7L+6QBDRkc6GZt5R2Vfa1Lm189DB6sDzdFmxm66pNfemk6bZviY7m/0p5l9+fTJAwC0ddiTy2
	GdLL/SoobkrIyO20+6g4Oaa+EkKxW95M00IUgPRbJJ1UllfEQMg4ah4MBH306Eo0c5OyYsvrLrI
	+EzgHoTXU+gpCQyO1E9GgpjlJ4ZEygb3A5tDU62kR/QjesqaEXhq7b7einKI8v9/EEA2qe41QnY
	W0Z/Q2IRbSFQkZC8NxrRUFVjj2Qt7TOpTSecxqOc3
X-Received: by 2002:a05:693c:8206:b0:36f:f3b7:6dee with SMTP id 5a478bee46e88-37966e3ab88mr10427324eec.7.1794798246554;
        Sun, 15 Nov 2026 19:04:06 -0800 (PST)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379508762a5sm29195595eec.0.2026.11.15.19.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 19:04:06 -0800 (PST)
From: HyeongJun An <sammiee5311@gmail.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Mark Brown <broonie@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH 4/4] selftests/alsa: Test the sequencer UMP Note On/Off conversion
Date: Mon, 16 Nov 2026 12:03:37 +0900
Message-ID: <20261116030338.422671-5-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116030338.422671-1-sammiee5311@gmail.com>
References: <20261116030338.422671-1-sammiee5311@gmail.com>
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

seq-ump-test only covers the RPN/NRPN conversion. Check that a Note On
with zero velocity becomes a Note Off and that a key pressure of zero
stays a key pressure, from a legacy client to UMP MIDI 1.0 and MIDI 2.0
clients. Also check Note On and Note Off between UMP MIDI 1.0 and MIDI
2.0 clients.

Without the three previous fixes, midi1_key_pressure,
ump_midi1_to_midi2_note and ump_midi2_to_midi1_note fail.

Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 tools/testing/selftests/alsa/seq-ump-test.c | 187 +++++++++++++++++++-
 1 file changed, 179 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/alsa/seq-ump-test.c b/tools/testing/selftests/alsa/seq-ump-test.c
index d1eca920cfc8..55bb7ea5b02f 100644
--- a/tools/testing/selftests/alsa/seq-ump-test.c
+++ b/tools/testing/selftests/alsa/seq-ump-test.c
@@ -1,11 +1,11 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Test the conversion of MIDI 1.0 sequencer events to UMP.
+ * Test the sequencer conversion of MIDI 1.0 events to UMP, and of UMP
+ * packets between MIDI 1.0 and MIDI 2.0 clients.
  *
- * A legacy client sends CC and CONTROL14 events to a UMP client, and the
- * test checks the packets that the UMP client receives. The converter keeps
- * its RPN/NRPN state per destination port and channel, so each test uses
- * new clients.
+ * A client sends events to a UMP client, and the test checks the packets
+ * that the UMP client receives. The converter keeps its RPN/NRPN state
+ * per destination port and channel, so each test uses new clients.
  */
 #include <errno.h>
 #include <fcntl.h>
@@ -124,6 +124,48 @@ static int send_event(struct seq_client *src, struct seq_client *dst,
 	return 0;
 }
 
+static int send_note(struct seq_client *src, struct seq_client *dst,
+		     int type, int ch, int note, int velocity)
+{
+	struct snd_seq_event ev;
+
+	memset(&ev, 0, sizeof(ev));
+	ev.type = type;
+	ev.flags = SNDRV_SEQ_TIME_STAMP_TICK | SNDRV_SEQ_EVENT_LENGTH_FIXED;
+	ev.queue = SNDRV_SEQ_QUEUE_DIRECT;
+	ev.source.client = src->id;
+	ev.source.port = src->port;
+	ev.dest.client = dst->id;
+	ev.dest.port = dst->port;
+	ev.data.note.channel = ch;
+	ev.data.note.note = note;
+	ev.data.note.velocity = velocity;
+	if (write(src->fd, &ev, sizeof(ev)) != sizeof(ev))
+		return -errno;
+	return 0;
+}
+
+/* send a UMP packet from a UMP client */
+static int send_ump(struct seq_client *src, struct seq_client *dst,
+		    unsigned int w0, unsigned int w1)
+{
+	struct snd_seq_ump_event ev;
+
+	memset(&ev, 0, sizeof(ev));
+	ev.flags = SNDRV_SEQ_TIME_STAMP_TICK | SNDRV_SEQ_EVENT_LENGTH_FIXED |
+		   SNDRV_SEQ_EVENT_UMP;
+	ev.queue = SNDRV_SEQ_QUEUE_DIRECT;
+	ev.source.client = src->id;
+	ev.source.port = src->port;
+	ev.dest.client = dst->id;
+	ev.dest.port = dst->port;
+	ev.ump[0] = w0;
+	ev.ump[1] = w1;
+	if (write(src->fd, &ev, sizeof(ev)) != sizeof(ev))
+		return -errno;
+	return 0;
+}
+
 /*
  * Read what the UMP client received until it is quiet, and keep the
  * packets of message type @mt. Returns the number of packets kept.
@@ -212,11 +254,11 @@ static int send_events(struct seq_client *src, struct seq_client *dst,
 				 ARRAY_SIZE(ev)));			\
 } while (0)
 
-/* compare the RPN/NRPN packets received with the expected ones */
-#define EXPECT_PACKETS(...) do {					\
+/* compare the packets of message type @mt with the expected ones */
+#define EXPECT_MT_PACKETS(mt, ...) do {					\
 	const struct packet want[] = { __VA_ARGS__ };			\
 	struct packet got[MAX_PACKETS];					\
-	int n = read_packets(&self->dst, 4, got);			\
+	int n = read_packets(&self->dst, mt, got);			\
 	int i;								\
 									\
 	ASSERT_EQ((int)ARRAY_SIZE(want), n);				\
@@ -226,12 +268,22 @@ static int send_events(struct seq_client *src, struct seq_client *dst,
 	}								\
 } while (0)
 
+/* compare the MIDI 2.0 channel voice packets received */
+#define EXPECT_PACKETS(...)	EXPECT_MT_PACKETS(4, __VA_ARGS__)
+
 #define EXPECT_NO_PACKETS() do {					\
 	struct packet got[MAX_PACKETS];					\
 									\
 	EXPECT_EQ(0, read_packets(&self->dst, 4, got));			\
 } while (0)
 
+#define SEND_NOTE(type, ch, note, velocity)				\
+	ASSERT_EQ(0, send_note(&self->src, &self->dst,			\
+			       SNDRV_SEQ_EVENT_##type, ch, note, velocity))
+
+#define SEND_UMP(w0, w1) \
+	ASSERT_EQ(0, send_ump(&self->src, &self->dst, w0, w1))
+
 /* RPN 0/1 with Data Entry */
 TEST_F(seq_ump, rpn)
 {
@@ -416,6 +468,20 @@ TEST_F(seq_ump, c14_null_nrpn_keeps_rpn_number)
 	EXPECT_PACKETS({ RPN(0, 0, 1), data14(0x10, 0) });
 }
 
+/* a note-on with zero velocity is a note-off */
+TEST_F(seq_ump, note_on_zero_velocity)
+{
+	SEND_NOTE(NOTEON, 1, 60, 0);
+	EXPECT_PACKETS({ 0x40813c00, 0 });
+}
+
+/* a key pressure of zero is a key pressure, not a note-off */
+TEST_F(seq_ump, key_pressure)
+{
+	SEND_NOTE(KEYPRESS, 2, 64, 0);
+	EXPECT_PACKETS({ 0x40a24000, 0 });
+}
+
 /* a UMP MIDI 1.0 client gets the CCs as they are, RPN selection included */
 TEST(midi1_passthrough)
 {
@@ -449,4 +515,109 @@ TEST(midi1_passthrough)
 	close_client(&dst);
 }
 
+/* a pair of clients whose MIDI versions each test chooses */
+FIXTURE(seq_pair) {
+	struct seq_client src;
+	struct seq_client dst;
+};
+
+FIXTURE_SETUP(seq_pair)
+{
+	self->src.fd = -1;
+	self->dst.fd = -1;
+}
+
+FIXTURE_TEARDOWN(seq_pair)
+{
+	close_client(&self->src);
+	close_client(&self->dst);
+}
+
+static int open_pair(struct seq_client *dst, int dst_version,
+		     struct seq_client *src, int src_version, int *skip)
+{
+	int err;
+
+	err = open_client(dst, dst_version, CAP_IN, skip);
+	if (!err)
+		err = open_client(src, src_version, CAP_OUT, skip);
+	return err;
+}
+
+/* to UMP MIDI 1.0, a key pressure of zero is a key pressure */
+TEST_F(seq_pair, midi1_key_pressure)
+{
+	int skip = 0;
+	int err;
+
+	err = open_pair(&self->dst, SNDRV_SEQ_CLIENT_UMP_MIDI_1_0,
+			&self->src, 0, &skip);
+	if (skip)
+		SKIP(return, "UMP sequencer client unavailable: %s",
+		     strerror(-err));
+	ASSERT_EQ(0, err);
+
+	SEND_NOTE(KEYPRESS, 2, 64, 0x50);
+	SEND_NOTE(KEYPRESS, 2, 64, 0);
+	EXPECT_MT_PACKETS(2, { 0x20a24050, 0 }, { 0x20a24000, 0 });
+}
+
+/* to UMP MIDI 1.0, a note-on with zero velocity is a note-off */
+TEST_F(seq_pair, midi1_note_on_zero_velocity)
+{
+	int skip = 0;
+	int err;
+
+	err = open_pair(&self->dst, SNDRV_SEQ_CLIENT_UMP_MIDI_1_0,
+			&self->src, 0, &skip);
+	if (skip)
+		SKIP(return, "UMP sequencer client unavailable: %s",
+		     strerror(-err));
+	ASSERT_EQ(0, err);
+
+	SEND_NOTE(NOTEON, 1, 60, 0);
+	EXPECT_MT_PACKETS(2, { 0x20813c00, 0 });
+}
+
+/* UMP MIDI 1.0 to MIDI 2.0: a note-on with zero velocity is a note-off */
+TEST_F(seq_pair, ump_midi1_to_midi2_note)
+{
+	int skip = 0;
+	int err;
+
+	err = open_pair(&self->dst, SNDRV_SEQ_CLIENT_UMP_MIDI_2_0,
+			&self->src, SNDRV_SEQ_CLIENT_UMP_MIDI_1_0, &skip);
+	if (skip)
+		SKIP(return, "UMP sequencer client unavailable: %s",
+		     strerror(-err));
+	ASSERT_EQ(0, err);
+
+	SEND_UMP(0x20913c00, 0);
+	EXPECT_PACKETS({ 0x40813c00, 0 });
+}
+
+/*
+ * UMP MIDI 2.0 to MIDI 1.0: a note-on whose velocity scales down to zero
+ * stays a note-on with velocity 1, and a note-off stays a note-off
+ */
+TEST_F(seq_pair, ump_midi2_to_midi1_note)
+{
+	int skip = 0;
+	int err;
+
+	err = open_pair(&self->dst, SNDRV_SEQ_CLIENT_UMP_MIDI_1_0,
+			&self->src, SNDRV_SEQ_CLIENT_UMP_MIDI_2_0, &skip);
+	if (skip)
+		SKIP(return, "UMP sequencer client unavailable: %s",
+		     strerror(-err));
+	ASSERT_EQ(0, err);
+
+	SEND_UMP(0x40913c00, 0xc8000000);
+	SEND_UMP(0x40913c00, 0x01000000);
+	SEND_UMP(0x40913c00, 0);
+	SEND_UMP(0x40813c00, 0);
+	EXPECT_MT_PACKETS(2, { 0x20913c64, 0 }, { 0x20913c01, 0 },
+			  { 0x20913c01, 0 }, { 0x20813c00, 0 });
+}
+
 TEST_HARNESS_MAIN
-- 
2.43.0

