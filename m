Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 948613E95A4
	for <linux-sound@vger.kernel.org>; Sun, 13 Sep 2026 13:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789307094; cv=none; b=Vj1LFCuq9j11zZa2B8qVFGOjjnW633x0KPUKsEXGefrDGXhPGpDqSVQkXfayLPK+mknWDzVrCCF7UpCUlfXqUZzUWFHYIi5ScZIEhK8xDWXBP78XmDixrW7526ZQfJSuGu32zxZlEUwADkbaDlT+izoexu114KqgjraWxfnyqzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789307094; c=relaxed/simple;
	bh=5u1iNb3hhaMKq5M3sBr8uvcPMeMiKlIXiJ9KCIHCSJY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BSNHBc603g3Fz6x5SrNb9bsDpF4vgYBdo+G378y1QOzOUq2GNH/OH36vjlpU3YFOm0ufwKO0Sq1qgHzBBhOj596leGmnwsLTDNx8iK41oVD8Q8y0AEXzWwPJdhAMakPdXDxZF8+AacbiWBRWW3DvIcSTgCsdCSiD8srbZtFoWvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GJ0OE+UA; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GJ0OE+UA"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-869d181419bso2249930b3a.2
        for <linux-sound@vger.kernel.org>; Sun, 13 Sep 2026 06:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789307093; x=1789911893; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hSYoRdUaLcILeZ/Zm0aWvKlTfSaQSuBQlZD7r76kq7s=;
        b=GJ0OE+UA9lRo0n3I6zTNdKSZ6FZhG4TNt1vgGSbwXFwATHxkVmASChN9OiccuuJko8
         8VbVdydD51D9xRpvjf6HxMWze01DjuUij/pXwSZMwa2fMtMwvfbh3aEqZnv8x0B3gGZS
         JgUpEcFpGpz5qOjIvh0QuKWHryFN7qO0NaV667oCMRtJ22V8S2hDI/FEV4E+/0lMkfOz
         shYzLc5px5fn/Dp8cxQG4owcFaw/SGAuQHKxqCYDJ9Jnf9vUFQ8b4hzUeuuwxeKqI2XA
         OTZcXwRVTJ8l4p9oeq9Fn551z1fOF+3FvpeRfZpi8ueBNSIVnKwyDynUufHDoVgA3qaX
         4ahA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789307093; x=1789911893;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hSYoRdUaLcILeZ/Zm0aWvKlTfSaQSuBQlZD7r76kq7s=;
        b=SpVF+HnB13qbdwMQo/Yvo79QJEy3SNm2XMb5zc68qvWg3CwaIEePz5RrSiZ7opvtlM
         W40u0As1PN+AxpfveNco28dN+l1aYB45dVVROR0smV0/SWPcUSfZUIcNnYLLrpBn2csA
         W+Tb8Czt0jzQ5Gzu+BYfeUAnBZStq+VVEc+L9/Fip06Cv803S915q45fHmyOq6JkOS2b
         +L8/laWH7xLzKBGSRQML31Ae0C1kQen32PJ/FyphTjVxlba+g9pJo1amGOYgiRRSRvVP
         Ocmkc2ayDTUGiG1sNwCqdOZw9iXXZLPVx6/gP1Fid8EaFZZOvFK9sewtKCLTOLLLFxgu
         P+Pg==
X-Forwarded-Encrypted: i=1; AKwUvBzwqnChPEmTKNjD8P0hNvA+tSjD9MjNskkE61Cd2Spus2WCrL6rY13+wIDkUEmaf37kVIHWzWIZBo/fhw==@vger.kernel.org
X-Gm-Message-State: AFuF++krGV5X2+FnQxn0ak7z4JVhNr1q9VZrSclo+8T+ZWSau9jS4hEK
	cxAML5XBZHX/mu/7RqN44YSS3W1pe7Nf24tPI5Dsao1ob5iJK+DWEKbE
X-Gm-Gg: AYBFou0pF2MC3JOoFSfj/H5+3zByfG/adje9MIpR0xrg8m6jqEeieN+ArbNwxB3aNB5
	Mz32t2s8/npi3Tq1NFxVcMstBr/Vr5rovp/TEnAZ8+vlznru+C7+aH6AXbpFz7dxgz9GDcmbpJj
	jI5FSG/FVTfkzx91dWfNritN1eAM9BhvVq8y1DLNxmbB7lni2PHSdO4QWYg5u5NGMwjRTMPKi5x
	Zm467/Ym45lXvFjd22iF/hMFPFWNPn4uBQUlKyxx1Fj/HgeBGglQE68lVmDIj5nv07TupjHxwg/
	ZXjuk/WGM8Usm5VW5CdiAweTPpCEVRGBXGWlQpBFz3c351tLrT4opkmtKBIdDXDaUd2QSZZ1k2u
	JGp6daInX4unV4BkI7N6KuatsXBrO0yvZ7VlEfJndzC7HuBHwxkUXgum7yI6teV0Q6J+A/MoLDB
	rnluPOZ6X+6/ZtlHAuDGqXkeEW2zucO9N0k7SeRFZhPbUk1bG3iotcyB8z3JM7VEmCRHvH5tyhk
	GuP9ybO9LDqwm7RaQ==
X-Received: by 2002:a05:6a00:1c95:b0:85a:bc69:bfc4 with SMTP id d2e1a72fcca58-86b2c0e9a55mr22954656b3a.0.1789307092765;
        Sun, 13 Sep 2026 06:44:52 -0700 (PDT)
Received: from thangnn-ASUS.. ([2405:4802:1d38:5c70:f608:4e94:6df6:c8b4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b250c019dsm3340944b3a.7.2026.09.13.06.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 06:44:52 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+19da64013c46df87f971@syzkaller.appspotmail.com
Subject: [PATCH] ALSA: pcm: set timer->private_data before registering the PCM timer
Date: Sun, 13 Sep 2026 20:44:46 +0700
Message-ID: <20260913134446.114724-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

snd_pcm_timer_init() calls snd_device_register() to link the new
struct snd_timer into the global timer list while it still carries
hw.c_resolution = snd_pcm_timer_resolution (and hw.start/hw.stop),
and only afterwards sets timer->private_data = substream.

Once the timer is on the list under register_mutex, a concurrent
reader can already reach it through the same mutex and invoke these
callbacks. /proc/asound/timers does this via c_resolution(), and
snd_timer_open()+snd_timer_start() reach start()/stop() the same way.
All three dereference timer->private_data, which for this brief
window is NULL, giving a NULL-pointer dereference:

  substream = timer->private_data;
  return substream->runtime ? ...   // substream is NULL

Move the private_data/private_free assignment before
snd_device_register() so the timer is never visible on the list
without its private_data set. On the snd_device_register() failure
path, private_free() (snd_pcm_timer_free()) can now run, but it only
does substream->timer = NULL, which is already NULL at that point
since substream->timer is set to the new timer just once, after a
successful registration -- so the failure path stays safe.

Reported-by: syzbot+19da64013c46df87f971@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=19da64013c46df87f971
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
 sound/core/pcm_timer.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/sound/core/pcm_timer.c b/sound/core/pcm_timer.c
index ab0e5bd70f8f..18bedd66435d 100644
--- a/sound/core/pcm_timer.c
+++ b/sound/core/pcm_timer.c
@@ -111,12 +111,15 @@ void snd_pcm_timer_init(struct snd_pcm_substream *substream)
 			snd_pcm_direction_name(substream->stream),
 			tid.card, tid.device, tid.subdevice);
 	timer->hw = snd_pcm_timer;
+	/* Set before registering: a concurrent reader can invoke our hw
+	 * callbacks as soon as the timer is on the global list.
+	 */
+	timer->private_data = substream;
+	timer->private_free = snd_pcm_timer_free;
 	if (snd_device_register(timer->card, timer) < 0) {
 		snd_device_free(timer->card, timer);
 		return;
 	}
-	timer->private_data = substream;
-	timer->private_free = snd_pcm_timer_free;
 	substream->timer = timer;
 }
 
-- 
2.43.0

