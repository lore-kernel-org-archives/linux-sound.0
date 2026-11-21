Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795274789;
	b=AchSqm3368i3eB3WAwz8v4zxF3mrvn6GMFvLmPELw5PZQ4GNZiXMCdV64YUlrFKpzpSK
	 ePqfEL4dmbV7cv7gXMF67xX0tcWwOOC4qRMPro5/9JjJfAycCFwKnpPcJk5majvUlf1xE
	 iBt+GyrnRqYjGweYME403GPsSBIhwPvtu/D2AuW+JMaw1tE/sDPi3esnYf8b3shbwVu+l
	 zQ+rQym3jrvtHg1Qi38otQ+LVMP9URV96UtrCD0wtrE56DASC4OWRMK1U4Hipd56KcDKJ
	 IaLIjaSb4h1CRcnoh0nz/3fP82+8gMgdpWCW/FUJQWitcMAQAKtBWi6CG3OqdQUuKsw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795274789;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=QC2cEHggkze8ARQwMAA8dJGzcnfsYoRrHYcMsVM/vFE=;
	b=YpW9pcJ0M4acAZ/dXHKKnR3I7MAseG70NCTpjvenX+m5ObCpwx3bcKBoSheD4jYkYUpe
	 WlT8TZ331kHQbkYs6yVbJXYgxjzmHtkOpLL2Y4TPwox1M20vzJyY6y0q2qQY5ciEiw5vQ
	 hrtRaYZZRiudBL6Gihb5iSNYyaRI7DFiI4q1ZKRhUyIe7aWo9woPm8q+335AG9W9TAwNN
	 XzRWhy8MGx0ral29g/uPGaTKdYt0+Zfxk82Dlma+/P/tF4B6LGO4kba4X/D4qBdV2jdeP
	 4mY+sLWpcOQIZfZuSOFfQeMj9KjlQkmLeKU9awGcMfFNauf+xOYLsPbiVZb931PgzLQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hPkfrWd9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C93B606A320;
	Sat, 21 Nov 2026 15:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hPkfrWd9
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795274789;
	b=WtSZwlWt86eEUtSwyFx4eLzcS9ZfTElpOL7p7oCundQeIGP1ZKeSfx2Z9taglIVYbt0o
	 WZ5QkE1DSKQ8tVkvEV6mruBWE0UKpDf4vky4eYdNkogF9s8s42XGi2aRkYE+vnpRzvREP
	 CRCpc0W5Sh7WK4QklW83zi/x+msM+SOz+pUY/gXswVQk+Hh9LMkb+u9llbGBvcWjohK2O
	 h3H2+2tWtFzjkY40YUyUMEZMXB3sjFW2u8PYv8FXvcdgk4Fjc0YoXRWTy5fBfi0LP1uCg
	 D41PNMT0AqTad2EPW77lY/UlpwcqXbU8fmESvjikK+HWl/gcVtjT/8kuPl9wPF1+Q5Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795274789;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=QC2cEHggkze8ARQwMAA8dJGzcnfsYoRrHYcMsVM/vFE=;
	b=bWwyNvgvN84wrabwGNLEpY/M3dqqTcMWAlcrOE0ALyWKgYBpGQ5OwpmC6gpJeQ367S6o
	 xSu5jtq4DKMVnKl/kyFzdkHCbc6NP3+GvcrpfIINH2W7lfsGIue+V8gZzJExpjd6rrN2U
	 q/l9whMf8YueRGgsM1GD3BMXLb/ibnzuaSiqJuZRDZy19q0mspPGFPp/qlYEz2TccopTw
	 oCGBV3p3J4QgzrqZ8/C9W73YmOafpYYGlCJT2yfltq0zSH1RfKQk5DU4eVb2jJf/x7yZy
	 4e3ygghRqUBeItouUuvgmuab6xwrRkfTIORaDU7InwysTeELtvJHvCLU7OUCz0rvKMQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 853371F000C6;
	Sat, 21 Nov 2026 15:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795274789;
	bh=QC2cEHggkze8ARQwMAA8dJGzcnfsYoRrHYcMsVM/vFE=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=hPkfrWd9dHSkfCd/YfmQx7OSfzipugP+Ut/daxWrXupNkxtBRzYETRJM+Alq78CsI
	 iHHIQVrpdFnVCtJ2N9Um8m2sinWpUyZzj1cmjJzb2oCvDmycDyd4FkJ4ZIb4Aw/5Td
	 8ljQbc9qHdUbHR2zHyuh+yZoW76K7L0rMLJs5fL3Uu3bsJQXOTT3tSbu/YqUke0l8K
	 yY1U18yfIE6orYjjMEAbguw+bfroC+eLaKxP+6KFmuMx9OFKudSIjCdnRloX3agLz3
	 MSuc9auo98BLo17Lv/Uks8kkJyE5tsfn4r/9llSskDfqeqpclpPBvh+uTMFg7q2+1Z
	 HBTmPQ2Yk4WdQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D8F804BCD5;
	Sat, 21 Nov 2026 15:26:27 +0000 (UTC)
From: Suyuan Wang via B4 Relay <devnull+shyckless.gmail.com@kernel.org>
Date: Sat, 21 Nov 2026 15:26:27 +0000
Subject: [PATCH] ASoC: SOF: ipc4-mtrace: fix the wrapped read when the user
 buffer is short
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261121-sof-mtrace-wrap-v1-1-9798707c3439@gmail.com>
X-B4-Tracking: v=1; b=H4sIACK4AWsC/yXMwQrCMAyA4VcZORuwHR3UVxEPtUlnBLeRbG4w9
 u5WPX6H/9/BWIUNLs0Oym8xGYcKd2ogP9LQMwpVgz/7zjnv0MaCr1lTZlw1TRioLRSJcgwt1Gp
 SLrL9jtfb37bcn5zn7waO4wO9roLXcwAAAA==
X-Change-ID: 20261121-sof-mtrace-wrap-5d3fd9ddc953
To: yung-chuan.liao@linux.intel.com, broonie@kernel.org, 
 lgirdwood@gmail.com, peter.ujfalusi@linux.intel.com
Cc: linux-kernel@vger.kernel.org, sound-open-firmware@alsa-project.org, 
 kai.vehmanen@linux.intel.com, tiwai@suse.com, 
 pierre-louis.bossart@linux.dev, daniel.baluta@nxp.com, 
 linux-sound@vger.kernel.org, perex@perex.cz
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795274787; l=2836;
 i=shyckless@gmail.com; s=default; h=from:subject:message-id;
 bh=eCZ+OHYWPM9lk6X07kSRGna3tHg4IdTpUM5N3XCFjbA=;
 b=gljffVztdZYIhKC+yfJh8dtwobmcl9RKf2zd3Vthk2kNVBmFUctSJ3Yrg54DcHdX/pg7VKPAQ
 y40IMyriAuGCFTG3uky0QbP9j1vYeAE5Yp/zliVCPp0hw3d5fQfAaAX
X-Developer-Key: i=shyckless@gmail.com; a=ed25519;
 pk=pMtccVGiWES3bV+7YBFuBclkvq2n2HBHQ5azaBrK2lY=
X-Endpoint-Received: by B4 Relay for shyckless@gmail.com/default with
 auth_id=1498
X-Original-From: Suyuan Wang <shyckless@gmail.com>
Reply-To: shyckless@gmail.com

From: Suyuan Wang <stevewong@hust.edu.cn>

When the log data wraps around the end of the slot,
sof_ipc4_mtrace_dfs_read() copies it in two parts:

	sof_mailbox_read(..., log_buffer, avail - write_ptr);
	sof_mailbox_read(..., log_buffer + avail - write_ptr, write_ptr);

This assumes that avail is still the full distance from read_ptr to
write_ptr. But avail has just been cut down to count - sizeof(avail) if
the user asked for less. If it ends up smaller than write_ptr,
avail - write_ptr wraps around, and the first sof_mailbox_read() gets a
length of about 4 GiB for the 4 KiB log_buffer.
For example, with read_ptr = 4080 and write_ptr = 16, a read of 12 bytes
gives avail = 8 and a copy of 0xfffffff8 bytes. If avail is cut but
still larger than write_ptr, the two parts don't line up with read_ptr
and the user gets the wrong bytes.

Copy from read_ptr up to the end of the slot, but no more than avail,
and take the rest from the start of the slot.

Found with a static analysis tool and checked by hand.

Fixes: f4ea22f7aa75 ("ASoC: SOF: ipc4: Add support for mtrace log extraction")
Cc: stable@vger.kernel.org
Co-developed-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Suyuan Wang <stevewong@hust.edu.cn>
---
Compile tested (x86_64, W=1). I don't have SOF hardware, so I checked
the pointer arithmetic in userspace instead: the code of this function
with the mailbox replaced by an array, under ASan. Without the patch a
12-byte read at read_ptr 4080, write_ptr 16 copies 0xfffffff8 bytes,
and a 104-byte read at read_ptr 4000 returns 16 wrong bytes; with it
both return the expected data.
---
 sound/soc/sof/ipc4-mtrace.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/sound/soc/sof/ipc4-mtrace.c b/sound/soc/sof/ipc4-mtrace.c
index 064291e26974..0d5135d256c3 100644
--- a/sound/soc/sof/ipc4-mtrace.c
+++ b/sound/soc/sof/ipc4-mtrace.c
@@ -230,14 +230,17 @@ static ssize_t sof_ipc4_mtrace_dfs_read(struct file *file, char __user *buffer,
 		/* Read data between read pointer and write pointer */
 		sof_mailbox_read(sdev, log_buffer_offset + read_ptr, log_buffer, avail);
 	} else {
+		/* avail may have been cut to the user's count above */
+		u32 tail = min(avail, log_buffer_size - read_ptr);
+
 		/* read from read pointer to end of the slot */
 		sof_mailbox_read(sdev, log_buffer_offset + read_ptr, log_buffer,
-				 avail - write_ptr);
-		/* read from slot start to write pointer */
-		if (write_ptr)
+				 tail);
+		/* read the rest from slot start */
+		if (avail > tail)
 			sof_mailbox_read(sdev, log_buffer_offset,
-					 (u8 *)(log_buffer) + avail - write_ptr,
-					 write_ptr);
+					 (u8 *)(log_buffer) + tail,
+					 avail - tail);
 	}
 
 	/* first write the number of bytes we have gathered */




