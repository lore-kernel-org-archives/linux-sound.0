Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560E237647E;
	Sun,  5 Jul 2026 08:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783241172; cv=none; b=Za9d4Rkx8WL9Fn1glVR4EW3LiTE3LUt9rH7/m+sF2UK2BiVx5d0hGBEEM38jXILQmU3mVyxfTUXeK1e3obbiUy/2p7/dYIeJeb8FIasfhuHKvzYSKkYiVJoLPdyB7Vh6zbro8G2DGw80jdU3TdLha4bd3dil7Gfe21/lDELt7E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783241172; c=relaxed/simple;
	bh=zIbR9uD+ZDsdqJU1zKL6uMp0yJcbpkcyGS1jzJrJDDA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t+HoeRTp7NKZ3boIxUh6OGOhU7aPTwy5mK+xIfS+VSU4A8SpIGLgncTtHMp5sowMKKen94sS7vKQbf2pnTzh+0gq1VHUXaTsLvsCQqpKWj7QLXVk8TnHLLbiJq/eoxu0n79+KdFh1Mh+yFDwC911X+eBuGWyjdEpI1252elnMKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-05 (Coremail) with SMTP id zQCowABHkcTLGUpqkbX8Fg--.7058S2;
	Sun, 05 Jul 2026 16:46:03 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Daniel Mack <zonque@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [PATCH] ALSA: usb-audio: caiaq: validate EP1 reply lengths
Date: Sun,  5 Jul 2026 16:46:01 +0800
Message-ID: <20260705084601.56400-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowABHkcTLGUpqkbX8Fg--.7058S2
X-Coremail-Antispam: 1UD129KBjvJXoWxWr47ZF1UtrWrtF45tFW7XFb_yoWrGF1rpF
	yrJa1agrs8XFnxtw12yF18ZrnxZrn7Wa9xJ398A345WFnxKrn5ur9rCFyFqrWrZr9Fkw4q
	vr43t3yruF43JF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkE14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
	1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
	6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v2
	6r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrV
	AFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCI
	c40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267
	AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_
	Cr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUxcT
	PUUUUU=
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

usb_ep1_command_reply_dispatch() uses buf[0] as a command byte and then
reads command-specific fixed items from the same URB buffer. Several
paths use buf + 1, buf[1], buf[2], or buf + 3 without first proving that
urb->actual_length contains those bytes.

Add per-command length checks, use a payload length derived from the
bytes after the command byte for the control-state copy, and reject short
analog input payloads before the input helper reads fixed offsets from
the EP1 reply.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
diff --git a/sound/usb/caiaq/device.c b/sound/usb/caiaq/device.c
index b20aae0..a16e592 100644
--- a/sound/usb/caiaq/device.c
+++ b/sound/usb/caiaq/device.c
@@ -134,14 +134,22 @@ static void usb_ep1_command_reply_dispatch (struct urb* urb)
 	struct device *dev = &urb->dev->dev;
 	struct snd_usb_caiaqdev *cdev = urb->context;
 	unsigned char *buf = urb->transfer_buffer;
+	unsigned int payload_len;
+	unsigned int copy_len;
 
 	if (urb->status || !cdev) {
 		dev_warn(dev, "received EP1 urb->status = %i\n", urb->status);
 		return;
 	}
+	if (urb->actual_length < 1)
+		return;
+
+	payload_len = urb->actual_length - 1;
 
 	switch(buf[0]) {
 	case EP1_CMD_GET_DEVICE_INFO:
+		if (payload_len < sizeof(struct caiaq_device_spec))
+			break;
 	 	memcpy(&cdev->spec, buf+1, sizeof(struct caiaq_device_spec));
 		cdev->spec.fw_version = le16_to_cpu(cdev->spec.fw_version);
 		dev_dbg(dev, "device spec (firmware %d): audio: %d in, %d out, "
@@ -157,18 +165,21 @@ static void usb_ep1_command_reply_dispatch (struct urb* urb)
 		wake_up(&cdev->ep1_wait_queue);
 		break;
 	case EP1_CMD_AUDIO_PARAMS:
+		if (payload_len < 1)
+			break;
 		cdev->audio_parm_answer = buf[1];
 		wake_up(&cdev->ep1_wait_queue);
 		break;
 	case EP1_CMD_MIDI_READ:
+		if (urb->actual_length < 3 || urb->actual_length - 3 < buf[2])
+			break;
 		snd_usb_caiaq_midi_handle_input(cdev, buf[1], buf + 3, buf[2]);
 		break;
 	case EP1_CMD_READ_IO:
 		if (cdev->chip.usb_id ==
 			USB_ID(USB_VID_NATIVEINSTRUMENTS, USB_PID_AUDIO8DJ)) {
-			if (urb->actual_length > sizeof(cdev->control_state))
-				urb->actual_length = sizeof(cdev->control_state);
-			memcpy(cdev->control_state, buf + 1, urb->actual_length);
+			copy_len = min_t(unsigned int, payload_len, sizeof(cdev->control_state));
+			memcpy(cdev->control_state, buf + 1, copy_len);
 			wake_up(&cdev->ep1_wait_queue);
 			break;
 		}
diff --git a/sound/usb/caiaq/input.c b/sound/usb/caiaq/input.c
index eabbf41..8d92433 100644
--- a/sound/usb/caiaq/input.c
+++ b/sound/usb/caiaq/input.c
@@ -203,6 +203,8 @@ static void snd_caiaq_input_read_analog(struct snd_usb_caiaqdev *cdev,
 
 	switch (cdev->chip.usb_id) {
 	case USB_ID(USB_VID_NATIVEINSTRUMENTS, USB_PID_RIGKONTROL2):
+		if (len < 6)
+			return;
 		snd_caiaq_input_report_abs(cdev, ABS_X, buf, 2);
 		snd_caiaq_input_report_abs(cdev, ABS_Y, buf, 0);
 		snd_caiaq_input_report_abs(cdev, ABS_Z, buf, 1);
@@ -210,11 +212,15 @@ static void snd_caiaq_input_read_analog(struct snd_usb_caiaqdev *cdev,
 	case USB_ID(USB_VID_NATIVEINSTRUMENTS, USB_PID_RIGKONTROL3):
 	case USB_ID(USB_VID_NATIVEINSTRUMENTS, USB_PID_KORECONTROLLER):
 	case USB_ID(USB_VID_NATIVEINSTRUMENTS, USB_PID_KORECONTROLLER2):
+		if (len < 6)
+			return;
 		snd_caiaq_input_report_abs(cdev, ABS_X, buf, 0);
 		snd_caiaq_input_report_abs(cdev, ABS_Y, buf, 1);
 		snd_caiaq_input_report_abs(cdev, ABS_Z, buf, 2);
 		break;
 	case USB_ID(USB_VID_NATIVEINSTRUMENTS, USB_PID_TRAKTORKONTROLX1):
+		if (len < 16)
+			return;
 		snd_caiaq_input_report_abs(cdev, ABS_HAT0X, buf, 4);
 		snd_caiaq_input_report_abs(cdev, ABS_HAT0Y, buf, 2);
 		snd_caiaq_input_report_abs(cdev, ABS_HAT1X, buf, 6);

