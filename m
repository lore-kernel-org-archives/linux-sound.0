Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 251A9188938
	for <linux-sound@vger.kernel.org>; Thu,  2 Jan 2025 22:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.16.231.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735857515; cv=none; b=igXBKjDh3PDlrHYcnvBFRffZc+aqFT7kRAvrXrehiE9df9iTHOBgc8cB6IzQcXHy8txY/Y71P5llQh7xOtEmyscNhEQUAmnSHItcpmLclbwwU9xH4xVpJ+J1darNdqNVZ0pxr5YlKCwSglIORa+3A724vu1h+1S/jFfIlaZr8XI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735857515; c=relaxed/simple;
	bh=dvygVWyztdSVklQc7AFwV1yIpbzu+JaUcPjfplj7+Lo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UKkuM1VdMU9Cg1SBfVszDVn/Eg5Nv2V0L+SiLWt74vIeHc8gmQwM58mW9iubg3Nmby9aLTpuR6iq72Y8Aft6qA5h3G9IHg580BBVoIK0hdoJRFBFx8LrNiAD6PgRTqPrmG8XvbpCvJmH/ODOehjF2ITv2rIkwHju2/eQYRVCWxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu; spf=pass smtp.mailfrom=b4.vu; dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b=XT48LITE; arc=none smtp.client-ip=203.16.231.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="XT48LITE"
Received: by m.b4.vu (Postfix, from userid 1000)
	id 0719E646FC16; Fri,  3 Jan 2025 09:08:29 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 0719E646FC16
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1735857509; bh=BVm1kYT7ZBe5IfF5q9yNNha1aduBFO9U3zr+4tKr+cQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XT48LITEKW037XXfbCZ0REaeTkomCzru22wj4bSNeonqIfuqpr7Bxfs8plAn4S2Ub
	 M96SRhOrzkh0g3Gw5YMogvPyxNiKMmic7S3dXpd9UrGk0GLPrbciHD13Fq925zupqz
	 5EBqYdTwWidbxV0thCzqdjRrQAbnt2fATkVYZke47HZcttlO5ZDFDuwNfuq+3W54Mo
	 teemOX1CDgWKo1geesnONUsfLeEq7SiE7ACviM9zF2/VIvAlrfjN7JZy3L6BYyMxYw
	 wAPm07kvjGlGmMXYb52ZXQQEFrL1UxywiqAKCBO8etsuhpsKpfG+7M1ME2ULuxdRJ6
	 X4oVmkYKfG98Q==
Date: Fri, 3 Jan 2025 09:08:28 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: [PATCH v3 1/2] ALSA: FCP: Add Focusrite Control Protocol driver
Message-ID: <e4cf6c5cce4dae1d511a84718c7e61faa100490a.1735855597.git.g@b4.vu>
References: <cover.1735855597.git.g@b4.vu>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1735855597.git.g@b4.vu>

Add a new kernel driver for the Focusrite Control Protocol (FCP),
which is used by Focusrite Scarlett 2nd Gen, 3rd Gen, 4th Gen, Clarett
USB, Clarett+, and Vocaster series audio interfaces. This driver
provides a user-space control interface via ALSA's hwdep subsystem.

Unlike the existing Scarlett2 driver which implements all ALSA
controls in kernel space, this new FCP driver takes a different
approach by providing a minimal kernel interface that allows a
user-space driver to send FCP commands and receive notifications. The
only control implemented in kernel space is the Level Meter, since it
requires frequent polling of volatile data.

While this driver supports all interfaces that the Scarlett2 driver
works with, it is initially enabled only for 4th Gen 16i16, 18i16,
and 18i20 interfaces that are not supported by the Scarlett2 driver.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 MAINTAINERS              |  10 +-
 include/uapi/sound/fcp.h |  71 +++
 sound/usb/Makefile       |   1 +
 sound/usb/fcp.c          | 979 +++++++++++++++++++++++++++++++++++++++
 sound/usb/fcp.h          |   7 +
 sound/usb/mixer_quirks.c |   7 +
 6 files changed, 1071 insertions(+), 4 deletions(-)
 create mode 100644 include/uapi/sound/fcp.h
 create mode 100644 sound/usb/fcp.c
 create mode 100644 sound/usb/fcp.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 6bb4ec0c162a..2fd0945cb738 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8868,14 +8868,16 @@ L:	linux-input@vger.kernel.org
 S:	Maintained
 F:	drivers/input/joystick/fsia6b.c
 
-FOCUSRITE SCARLETT2 MIXER DRIVER (Scarlett Gen 2+ and Clarett)
+FOCUSRITE CONTROL PROTOCOL/SCARLETT2 MIXER DRIVERS (Scarlett Gen 2+, Clarett, and Vocaster)
 M:	Geoffrey D. Bennett <g@b4.vu>
 L:	linux-sound@vger.kernel.org
 S:	Maintained
-W:	https://github.com/geoffreybennett/scarlett-gen2
-B:	https://github.com/geoffreybennett/scarlett-gen2/issues
-T:	git https://github.com/geoffreybennett/scarlett-gen2.git
+W:	https://github.com/geoffreybennett/linux-fcp
+B:	https://github.com/geoffreybennett/linux-fcp/issues
+T:	git https://github.com/geoffreybennett/linux-fcp.git
+F:	include/uapi/sound/fcp.h
 F:	include/uapi/sound/scarlett2.h
+F:	sound/usb/fcp.c
 F:	sound/usb/mixer_scarlett2.c
 
 FORCEDETH GIGABIT ETHERNET DRIVER
diff --git a/include/uapi/sound/fcp.h b/include/uapi/sound/fcp.h
new file mode 100644
index 000000000000..a9046849af13
--- /dev/null
+++ b/include/uapi/sound/fcp.h
@@ -0,0 +1,71 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/*
+ * Focusrite Control Protocol Driver for ALSA
+ *
+ * Copyright (c) 2024 by Geoffrey D. Bennett <g at b4.vu>
+ */
+#ifndef __UAPI_SOUND_FCP_H
+#define __UAPI_SOUND_FCP_H
+
+#ifdef __KERNEL__
+#include <linux/types.h>
+#else
+#include <stdint.h>
+#endif
+
+#include <linux/ioctl.h>
+
+#define FCP_HWDEP_MAJOR 2
+#define FCP_HWDEP_MINOR 0
+#define FCP_HWDEP_SUBMINOR 0
+
+#define FCP_HWDEP_VERSION \
+	((FCP_HWDEP_MAJOR << 16) | \
+	 (FCP_HWDEP_MINOR << 8) | \
+	  FCP_HWDEP_SUBMINOR)
+
+#define FCP_HWDEP_VERSION_MAJOR(v) (((v) >> 16) & 0xFF)
+#define FCP_HWDEP_VERSION_MINOR(v) (((v) >> 8) & 0xFF)
+#define FCP_HWDEP_VERSION_SUBMINOR(v) ((v) & 0xFF)
+
+/* Get protocol version */
+#define FCP_IOCTL_PVERSION _IOR('S', 0x60, int)
+
+/* Start the protocol */
+
+struct fcp_init_v1 {
+	uint32_t version;
+	uint16_t step0_size;
+	uint16_t step2_size;
+	uint32_t init1_opcode;
+	uint32_t init2_opcode;
+	uint64_t step0_resp;
+	uint64_t step2_resp;
+} __attribute__((packed));
+
+union fcp_init {
+	uint32_t version;
+	struct fcp_init_v1 v1;
+};
+
+#define FCP_IOCTL_INIT _IOWR('S', 0x64, union fcp_init)
+
+/* Perform a command */
+struct fcp_cmd {
+	uint32_t opcode;
+	uint16_t req_size;
+	uint16_t resp_size;
+	uint64_t req;
+	uint64_t resp;
+} __attribute__((packed));
+#define FCP_IOCTL_CMD _IOWR('S', 0x65, struct fcp_cmd)
+
+/* Set the meter map */
+struct fcp_meter_map {
+	uint64_t map;
+	uint16_t map_size;
+	uint16_t meter_slots;
+} __attribute__((packed));
+#define FCP_IOCTL_SET_METER_MAP _IOW('S', 0x66, struct fcp_meter_map)
+
+#endif /* __UAPI_SOUND_FCP_H */
diff --git a/sound/usb/Makefile b/sound/usb/Makefile
index 0532499dbc6d..30bd5348477b 100644
--- a/sound/usb/Makefile
+++ b/sound/usb/Makefile
@@ -6,6 +6,7 @@
 snd-usb-audio-y := 	card.o \
 			clock.o \
 			endpoint.o \
+			fcp.o \
 			format.o \
 			helper.o \
 			implicit.o \
diff --git a/sound/usb/fcp.c b/sound/usb/fcp.c
new file mode 100644
index 000000000000..cf1156d93aeb
--- /dev/null
+++ b/sound/usb/fcp.c
@@ -0,0 +1,979 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Focusrite Control Protocol Driver for ALSA
+ *
+ * FCP is the vendor-specific protocol used by Focusrite Scarlett 2nd
+ * Gen, 3rd Gen, 4th Gen, Clarett USB, Clarett+, and Vocaster series.
+ *
+ * This driver provides a hwdep interface for userspace to send FCP
+ * commands and receive notifications which is sufficient to implement
+ * all user-space controls except the Level Meter (which is volatile
+ * and thus requires a kernel-space control).
+ *
+ * Copyright (c) 2024 by Geoffrey D. Bennett <g at b4.vu>
+ */
+
+#include <linux/slab.h>
+#include <linux/usb.h>
+
+#include <sound/control.h>
+#include <sound/hwdep.h>
+
+#include <uapi/sound/fcp.h>
+
+#include "usbaudio.h"
+#include "mixer.h"
+#include "helper.h"
+
+#include "fcp.h"
+
+/* notify waiting to send to *file */
+struct fcp_notify {
+	wait_queue_head_t queue;
+	u32               event;
+	spinlock_t        lock;
+};
+
+struct fcp_data {
+	struct usb_mixer_interface *mixer;
+
+	struct mutex mutex;         /* serialise access to the device */
+	struct completion cmd_done; /* wait for command completion */
+	struct file *file;          /* hwdep file */
+
+	struct fcp_notify notify;
+
+	u8  bInterfaceNumber;
+	u8  bEndpointAddress;
+	u16 wMaxPacketSize;
+	u8  bInterval;
+
+	uint16_t step0_size;
+	uint16_t step2_size;
+	uint32_t init1_opcode;
+	uint32_t init2_opcode;
+
+	u8  init;
+	u16 seq;
+
+	u8    num_meter_slots;
+	s16  *meter_level_map;
+	char *meter_labels;
+	int   meter_labels_size;
+	struct snd_kcontrol *meter_ctl;
+};
+
+/*** USB Interactions ***/
+
+/* FCP Command ACK notification bit */
+#define FCP_NOTIFY_ACK 1
+
+/* Vendor-specific USB control requests */
+#define FCP_USB_REQ_STEP0  0
+#define FCP_USB_REQ_CMD_TX 2
+#define FCP_USB_REQ_CMD_RX 3
+
+/* Focusrite Control Protocol opcodes that the kernel side needs to
+ * know about
+ */
+#define FCP_USB_REBOOT    0x00000003
+#define FCP_USB_GET_METER 0x00001001
+
+#define FCP_USB_METER_LEVELS_GET_MAGIC 1
+
+/* Forward declarations */
+static int fcp_init(struct usb_mixer_interface *mixer,
+		    void *step0_resp, void *step2_resp);
+
+/* FCP command request/response format */
+struct fcp_usb_packet {
+	__le32 opcode;
+	__le16 size;
+	__le16 seq;
+	__le32 error;
+	__le32 pad;
+	u8 data[];
+};
+
+static void fcp_fill_request_header(struct fcp_data *private,
+				    struct fcp_usb_packet *req,
+				    u32 opcode, u16 req_size)
+{
+	/* sequence must go up by 1 for each request */
+	u16 seq = private->seq++;
+
+	req->opcode = cpu_to_le32(opcode);
+	req->size = cpu_to_le16(req_size);
+	req->seq = cpu_to_le16(seq);
+	req->error = 0;
+	req->pad = 0;
+}
+
+static int fcp_usb_tx(struct usb_device *dev, int interface,
+		      void *buf, u16 size)
+{
+	return snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			FCP_USB_REQ_CMD_TX,
+			USB_RECIP_INTERFACE | USB_TYPE_CLASS | USB_DIR_OUT,
+			0, interface, buf, size);
+}
+
+static int fcp_usb_rx(struct usb_device *dev, int interface,
+		      void *buf, u16 size)
+{
+	return snd_usb_ctl_msg(dev, usb_rcvctrlpipe(dev, 0),
+			FCP_USB_REQ_CMD_RX,
+			USB_RECIP_INTERFACE | USB_TYPE_CLASS | USB_DIR_IN,
+			0, interface, buf, size);
+}
+
+/* Send an FCP command and get the response */
+static int fcp_usb(struct usb_mixer_interface *mixer, u32 opcode,
+		   const void *req_data, u16 req_size,
+		   void *resp_data, u16 resp_size)
+{
+	struct fcp_data *private = mixer->private_data;
+	struct usb_device *dev = mixer->chip->dev;
+	struct fcp_usb_packet *req __free(kfree) = NULL;
+	struct fcp_usb_packet *resp __free(kfree) = NULL;
+	size_t req_buf_size = struct_size(req, data, req_size);
+	size_t resp_buf_size = struct_size(resp, data, resp_size);
+	int retries = 0;
+	const int max_retries = 5;
+	int err;
+
+	if (!mixer->urb) {
+		void *step0_resp __free(kfree) = NULL;
+		void *step2_resp __free(kfree) = NULL;
+
+		step0_resp = kmalloc(private->step0_size, GFP_KERNEL);
+		if (!step0_resp)
+			return -ENOMEM;
+		step2_resp = kmalloc(private->step2_size, GFP_KERNEL);
+		if (!step2_resp)
+			return -ENOMEM;
+		err = fcp_init(mixer, step0_resp, step2_resp);
+		if (err < 0)
+			return err;
+	}
+
+	req = kmalloc(req_buf_size, GFP_KERNEL);
+	if (!req)
+		return -ENOMEM;
+
+	resp = kmalloc(resp_buf_size, GFP_KERNEL);
+	if (!resp)
+		return -ENOMEM;
+
+	/* build request message */
+	fcp_fill_request_header(private, req, opcode, req_size);
+	if (req_size)
+		memcpy(req->data, req_data, req_size);
+
+	/* send the request and retry on EPROTO */
+retry:
+	err = fcp_usb_tx(dev, private->bInterfaceNumber, req, req_buf_size);
+	if (err == -EPROTO && ++retries <= max_retries) {
+		msleep(1 << (retries - 1));
+		goto retry;
+	}
+
+	if (err != req_buf_size) {
+		usb_audio_err(mixer->chip,
+			      "FCP request %08x failed: %d\n", opcode, err);
+		return -EINVAL;
+	}
+
+	if (!wait_for_completion_timeout(&private->cmd_done,
+					 msecs_to_jiffies(1000))) {
+		usb_audio_err(mixer->chip,
+			      "FCP request %08x timed out\n", opcode);
+
+		return -ETIMEDOUT;
+	}
+
+	/* send a second message to get the response */
+
+	err = fcp_usb_rx(dev, private->bInterfaceNumber, resp, resp_buf_size);
+
+	/* validate the response */
+
+	if (err < 0) {
+
+		/* ESHUTDOWN and EPROTO are valid responses to a
+		 * reboot request
+		 */
+		if (opcode == FCP_USB_REBOOT &&
+		    (err == -ESHUTDOWN || err == -EPROTO))
+			return 0;
+
+		usb_audio_err(mixer->chip,
+			      "FCP read response %08x failed: %d\n",
+			      opcode, err);
+		return -EINVAL;
+	}
+
+	if (err < sizeof(*resp)) {
+		usb_audio_err(mixer->chip,
+			      "FCP response %08x too short: %d\n",
+			      opcode, err);
+		return -EINVAL;
+	}
+
+	if (req->seq != resp->seq) {
+		usb_audio_err(mixer->chip,
+			      "FCP response %08x seq mismatch %d/%d\n",
+			      opcode,
+			      le16_to_cpu(req->seq), le16_to_cpu(resp->seq));
+		return -EINVAL;
+	}
+
+	if (req->opcode != resp->opcode) {
+		usb_audio_err(mixer->chip,
+			      "FCP response %08x opcode mismatch %08x\n",
+			      opcode, le16_to_cpu(resp->opcode));
+		return -EINVAL;
+	}
+
+	if (resp->error) {
+		usb_audio_err(mixer->chip,
+			      "FCP response %08x error %d\n",
+			      opcode, le32_to_cpu(resp->error));
+		return -EINVAL;
+	}
+
+	if (err != resp_buf_size) {
+		usb_audio_err(mixer->chip,
+			      "FCP response %08x buffer size mismatch %d/%zu\n",
+			      opcode, err, resp_buf_size);
+		return -EINVAL;
+	}
+
+	if (resp_size != le16_to_cpu(resp->size)) {
+		usb_audio_err(mixer->chip,
+			      "FCP response %08x size mismatch %d/%d\n",
+			      opcode, resp_size, le16_to_cpu(resp->size));
+		return -EINVAL;
+	}
+
+	if (resp_data && resp_size > 0)
+		memcpy(resp_data, resp->data, resp_size);
+
+	return 0;
+}
+
+/*** Control Functions ***/
+
+/* helper function to create a new control */
+static int fcp_add_new_ctl(struct usb_mixer_interface *mixer,
+			   const struct snd_kcontrol_new *ncontrol,
+			   int index, int channels, const char *name,
+			   struct snd_kcontrol **kctl_return)
+{
+	struct snd_kcontrol *kctl;
+	struct usb_mixer_elem_info *elem;
+	int err;
+
+	elem = kzalloc(sizeof(*elem), GFP_KERNEL);
+	if (!elem)
+		return -ENOMEM;
+
+	/* We set USB_MIXER_BESPOKEN type, so that the core USB mixer code
+	 * ignores them for resume and other operations.
+	 * Also, the head.id field is set to 0, as we don't use this field.
+	 */
+	elem->head.mixer = mixer;
+	elem->control = index;
+	elem->head.id = 0;
+	elem->channels = channels;
+	elem->val_type = USB_MIXER_BESPOKEN;
+
+	kctl = snd_ctl_new1(ncontrol, elem);
+	if (!kctl) {
+		kfree(elem);
+		return -ENOMEM;
+	}
+	kctl->private_free = snd_usb_mixer_elem_free;
+
+	strscpy(kctl->id.name, name, sizeof(kctl->id.name));
+
+	err = snd_usb_mixer_add_control(&elem->head, kctl);
+	if (err < 0)
+		return err;
+
+	if (kctl_return)
+		*kctl_return = kctl;
+
+	return 0;
+}
+
+/*** Level Meter Control ***/
+
+static int fcp_meter_ctl_info(struct snd_kcontrol *kctl,
+			      struct snd_ctl_elem_info *uinfo)
+{
+	struct usb_mixer_elem_info *elem = kctl->private_data;
+
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+	uinfo->count = elem->channels;
+	uinfo->value.integer.min = 0;
+	uinfo->value.integer.max = 4095;
+	uinfo->value.integer.step = 1;
+	return 0;
+}
+
+static int fcp_meter_ctl_get(struct snd_kcontrol *kctl,
+			     struct snd_ctl_elem_value *ucontrol)
+{
+	struct usb_mixer_elem_info *elem = kctl->private_data;
+	struct usb_mixer_interface *mixer = elem->head.mixer;
+	struct fcp_data *private = mixer->private_data;
+	int num_meter_slots, resp_size;
+	u32 *resp __free(kfree) = NULL;
+	int i, err = 0;
+
+	struct {
+		__le16 pad;
+		__le16 num_meters;
+		__le32 magic;
+	} __packed req;
+
+	guard(mutex)(&private->mutex);
+
+	num_meter_slots = private->num_meter_slots;
+	resp_size = num_meter_slots * sizeof(u32);
+
+	resp = kmalloc(resp_size, GFP_KERNEL);
+	if (!resp)
+		return -ENOMEM;
+
+	req.pad = 0;
+	req.num_meters = cpu_to_le16(num_meter_slots);
+	req.magic = cpu_to_le32(FCP_USB_METER_LEVELS_GET_MAGIC);
+	err = fcp_usb(mixer, FCP_USB_GET_METER,
+		      &req, sizeof(req), resp, resp_size);
+	if (err < 0)
+		return err;
+
+	/* copy & translate from meter_levels[] using meter_level_map[] */
+	for (i = 0; i < elem->channels; i++) {
+		int idx = private->meter_level_map[i];
+		int value = idx < 0 ? 0 : le32_to_cpu(resp[idx]);
+
+		ucontrol->value.integer.value[i] = value;
+	}
+
+	return 0;
+}
+
+static int fcp_meter_tlv_callback(struct snd_kcontrol *kctl,
+				  int op_flag, unsigned int size,
+				  unsigned int __user *tlv)
+{
+	struct usb_mixer_elem_info *elem = kctl->private_data;
+	struct usb_mixer_interface *mixer = elem->head.mixer;
+	struct fcp_data *private = mixer->private_data;
+
+	if (op_flag == SNDRV_CTL_TLV_OP_READ) {
+		if (private->meter_labels_size == 0)
+			return 0;
+
+		if (size > private->meter_labels_size)
+			size = private->meter_labels_size;
+
+		if (copy_to_user(tlv, private->meter_labels, size))
+			return -EFAULT;
+
+		return size;
+	}
+
+	if (op_flag == SNDRV_CTL_TLV_OP_WRITE) {
+		kfree(private->meter_labels);
+		private->meter_labels = NULL;
+		private->meter_labels_size = 0;
+
+		if (size == 0)
+			return 0;
+
+		if (size > 4096)
+			return -EINVAL;
+
+		private->meter_labels = kmalloc(size, GFP_KERNEL);
+		if (!private->meter_labels)
+			return -ENOMEM;
+
+		if (copy_from_user(private->meter_labels, tlv, size)) {
+			kfree(private->meter_labels);
+			private->meter_labels = NULL;
+			return -EFAULT;
+		}
+
+		private->meter_labels_size = size;
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
+static const struct snd_kcontrol_new fcp_meter_ctl = {
+	.iface  = SNDRV_CTL_ELEM_IFACE_PCM,
+	.access = SNDRV_CTL_ELEM_ACCESS_READ |
+		  SNDRV_CTL_ELEM_ACCESS_VOLATILE |
+		  SNDRV_CTL_ELEM_ACCESS_TLV_READWRITE |
+		  SNDRV_CTL_ELEM_ACCESS_TLV_CALLBACK,
+	.info = fcp_meter_ctl_info,
+	.get  = fcp_meter_ctl_get,
+	.tlv  = { .c = fcp_meter_tlv_callback },
+};
+
+/*** hwdep interface ***/
+
+/* FCP initialisation */
+static int fcp_ioctl_init(struct usb_mixer_interface *mixer, unsigned long arg)
+{
+	union fcp_init init;
+	struct usb_device *dev = mixer->chip->dev;
+	struct fcp_data *private = mixer->private_data;
+	void *step0_resp __free(kfree) = NULL;
+	void *step2_resp __free(kfree) = NULL;
+	void __user *step0_resp_user;
+	void __user *step2_resp_user;
+	int err;
+
+	if (usb_pipe_type_check(dev, usb_sndctrlpipe(dev, 0)))
+		return -EINVAL;
+
+	/* First just get the version field */
+	if (copy_from_user(&init.version, (void __user *)arg,
+			   sizeof(init.version)))
+		return -EFAULT;
+
+	if (init.version != 1)
+		return -EINVAL;
+
+	/* Now get the rest of the v1 structure */
+	if (copy_from_user(&init, (void __user *)arg,
+			   sizeof(init)))
+		return -EFAULT;
+
+	step0_resp_user = u64_to_user_ptr(init.v1.step0_resp);
+	step2_resp_user = u64_to_user_ptr(init.v1.step2_resp);
+
+	if (init.v1.step0_size > 255 || init.v1.step2_size > 255)
+		return -EINVAL;
+
+	if (init.v1.step0_size > 0) {
+		step0_resp = kmalloc(init.v1.step0_size, GFP_KERNEL);
+		if (!step0_resp)
+			return -ENOMEM;
+	}
+
+	if (init.v1.step2_size > 0) {
+		step2_resp = kmalloc(init.v1.step2_size, GFP_KERNEL);
+		if (!step2_resp)
+			return -ENOMEM;
+	}
+
+	private->step0_size = init.v1.step0_size;
+	private->step2_size = init.v1.step2_size;
+	private->init1_opcode = init.v1.init1_opcode;
+	private->init2_opcode = init.v1.init2_opcode;
+
+	err = fcp_init(mixer, step0_resp, step2_resp);
+	if (err < 0)
+		return err;
+
+	if (copy_to_user(step0_resp_user, step0_resp, private->step0_size))
+		return -EFAULT;
+	if (copy_to_user(step2_resp_user, step2_resp, private->step2_size))
+		return -EFAULT;
+
+	return 0;
+}
+
+/* Execute an FCP command specified by the user */
+static int fcp_ioctl_cmd(struct usb_mixer_interface *mixer, unsigned long arg)
+{
+	struct fcp_cmd cmd;
+	void *req __free(kfree) = NULL;
+	void *resp __free(kfree) = NULL;
+	void __user *req_user;
+	void __user *resp_user;
+	int err;
+
+	/* get cmd & req/resp buffers */
+	if (copy_from_user(&cmd, (void __user *)arg, sizeof(cmd)))
+		return -EFAULT;
+
+	req_user = u64_to_user_ptr(cmd.req);
+	resp_user = u64_to_user_ptr(cmd.resp);
+
+	/* validate request and response sizes */
+	if (cmd.req_size > 4096 || cmd.resp_size > 4096)
+		return -EINVAL;
+
+	/* allocate request buffer, copy data from user */
+	if (cmd.req_size > 0) {
+		req = kmalloc(cmd.req_size, GFP_KERNEL);
+		if (!req)
+			return -ENOMEM;
+		if (copy_from_user(req, req_user, cmd.req_size))
+			return -EFAULT;
+	}
+
+	/* allocate response buffer */
+	if (cmd.resp_size > 0) {
+		resp = kmalloc(cmd.resp_size, GFP_KERNEL);
+		if (!resp)
+			return -ENOMEM;
+	}
+
+	/* send request, get response */
+	err = fcp_usb(mixer, cmd.opcode, req, cmd.req_size, resp, cmd.resp_size);
+	if (err < 0)
+		return err;
+
+	/* copy response to user */
+	if (cmd.resp_size > 0)
+		if (copy_to_user(resp_user, resp, cmd.resp_size))
+			return -EFAULT;
+
+	return 0;
+}
+
+/* Validate the Level Meter map passed by the user */
+static int validate_meter_map(const s16 *map, int map_size, int meter_slots)
+{
+	int i;
+
+	for (i = 0; i < map_size; i++)
+		if (map[i] < -1 || map[i] >= meter_slots)
+			return -EINVAL;
+
+	return 0;
+}
+
+/* Set the Level Meter map and add the control */
+static int fcp_ioctl_set_meter_map(struct usb_mixer_interface *mixer,
+				   unsigned long arg)
+{
+	struct fcp_meter_map map;
+	struct fcp_data *private = mixer->private_data;
+	s16 *tmp_map __free(kfree) = NULL;
+	void __user *map_user;
+	int err;
+
+	if (copy_from_user(&map, (void __user *)arg, sizeof(map)))
+		return -EFAULT;
+
+	map_user = u64_to_user_ptr(map.map);
+
+	/* Don't allow changing the map size or meter slots once set */
+	if (private->meter_ctl) {
+		struct usb_mixer_elem_info *elem =
+			private->meter_ctl->private_data;
+		if (map.map_size != elem->channels ||
+		    map.meter_slots != private->num_meter_slots)
+			return -EINVAL;
+	}
+
+	/* Validate the map and copy it from user space */
+
+	if (map.map_size < 1 || map.map_size > 255 ||
+	    map.meter_slots < 1 || map.meter_slots > 255)
+		return -EINVAL;
+
+	tmp_map = kmalloc_array(map.map_size, sizeof(s16), GFP_KERNEL);
+	if (!tmp_map)
+		return -ENOMEM;
+
+	if (copy_from_user(tmp_map, map_user, map.map_size * sizeof(s16)))
+		return -EFAULT;
+
+	err = validate_meter_map(tmp_map, map.map_size, map.meter_slots);
+	if (err < 0)
+		return err;
+
+	/* If the control doesn't exist, create it */
+	if (!private->meter_ctl) {
+		s16 *new_map = kmalloc_array(map.map_size, sizeof(s16),
+					     GFP_KERNEL);
+		if (!new_map)
+			return -ENOMEM;
+
+		err = fcp_add_new_ctl(mixer, &fcp_meter_ctl, 0, map.map_size,
+				      "Level Meter", &private->meter_ctl);
+		if (err < 0) {
+			kfree(new_map);
+			return err;
+		}
+		private->meter_level_map = new_map;
+		private->num_meter_slots = map.meter_slots;
+	}
+
+	/* Install the new map */
+	memcpy(private->meter_level_map, tmp_map, map.map_size * sizeof(s16));
+
+	return 0;
+}
+
+static int fcp_hwdep_open(struct snd_hwdep *hw, struct file *file)
+{
+	struct usb_mixer_interface *mixer = hw->private_data;
+	struct fcp_data *private = mixer->private_data;
+
+	private->file = file;
+
+	return 0;
+}
+
+static int fcp_hwdep_ioctl(struct snd_hwdep *hw, struct file *file,
+			   unsigned int cmd, unsigned long arg)
+{
+	struct usb_mixer_interface *mixer = hw->private_data;
+	struct fcp_data *private = mixer->private_data;
+
+	guard(mutex)(&private->mutex);
+
+	switch (cmd) {
+
+	case FCP_IOCTL_PVERSION:
+		return put_user(FCP_HWDEP_VERSION,
+				(int __user *)arg) ? -EFAULT : 0;
+		break;
+
+	case FCP_IOCTL_INIT:
+		return fcp_ioctl_init(mixer, arg);
+
+	case FCP_IOCTL_CMD:
+		if (!private->init)
+			return -EINVAL;
+		return fcp_ioctl_cmd(mixer, arg);
+
+	case FCP_IOCTL_SET_METER_MAP:
+		if (!private->init)
+			return -EINVAL;
+		return fcp_ioctl_set_meter_map(mixer, arg);
+
+	default:
+		return -ENOIOCTLCMD;
+	}
+
+	/* not reached */
+}
+
+static ssize_t fcp_hwdep_read(struct snd_hwdep *hw, char __user *buf,
+			      ssize_t count, loff_t *offset)
+{
+	struct usb_mixer_interface *mixer = hw->private_data;
+	struct fcp_data *private = mixer->private_data;
+	unsigned long flags;
+	ssize_t ret = 0;
+	u32 event;
+
+	if (count < sizeof(event))
+		return -EINVAL;
+
+	ret = wait_event_interruptible(private->notify.queue,
+				       private->notify.event);
+	if (ret)
+		return ret;
+
+	spin_lock_irqsave(&private->notify.lock, flags);
+	event = private->notify.event;
+	private->notify.event = 0;
+	spin_unlock_irqrestore(&private->notify.lock, flags);
+
+	if (copy_to_user(buf, &event, sizeof(event)))
+		return -EFAULT;
+
+	return sizeof(event);
+}
+
+static unsigned int fcp_hwdep_poll(struct snd_hwdep *hw,
+				   struct file *file,
+				   poll_table *wait)
+{
+	struct usb_mixer_interface *mixer = hw->private_data;
+	struct fcp_data *private = mixer->private_data;
+	unsigned int mask = 0;
+
+	poll_wait(file, &private->notify.queue, wait);
+
+	if (private->notify.event)
+		mask |= POLLIN | POLLRDNORM;
+
+	return mask;
+}
+
+static int fcp_hwdep_release(struct snd_hwdep *hw, struct file *file)
+{
+	struct usb_mixer_interface *mixer = hw->private_data;
+	struct fcp_data *private = mixer->private_data;
+
+	if (!private)
+		return 0;
+
+	private->file = NULL;
+
+	return 0;
+}
+
+static int fcp_hwdep_init(struct usb_mixer_interface *mixer)
+{
+	struct snd_hwdep *hw;
+	int err;
+
+	err = snd_hwdep_new(mixer->chip->card, "Focusrite Control", 0, &hw);
+	if (err < 0)
+		return err;
+
+	hw->private_data = mixer;
+	hw->exclusive = 1;
+	hw->ops.open = fcp_hwdep_open;
+	hw->ops.ioctl = fcp_hwdep_ioctl;
+	hw->ops.ioctl_compat = fcp_hwdep_ioctl;
+	hw->ops.read = fcp_hwdep_read;
+	hw->ops.poll = fcp_hwdep_poll;
+	hw->ops.release = fcp_hwdep_release;
+
+	return 0;
+}
+
+/*** Cleanup ***/
+
+static void fcp_private_free(struct usb_mixer_interface *mixer)
+{
+	struct fcp_data *private = mixer->private_data;
+
+	if (mixer->urb) {
+		usb_kill_urb(mixer->urb);
+		kfree(mixer->urb->transfer_buffer);
+		usb_free_urb(mixer->urb);
+		mixer->urb = NULL;
+	}
+
+	kfree(private->meter_level_map);
+	kfree(private->meter_labels);
+	kfree(private);
+	mixer->private_data = NULL;
+}
+
+static void fcp_private_suspend(struct usb_mixer_interface *mixer)
+{
+	if (!mixer->urb)
+		return;
+
+	usb_kill_urb(mixer->urb);
+	kfree(mixer->urb->transfer_buffer);
+	usb_free_urb(mixer->urb);
+	mixer->urb = NULL;
+}
+
+/*** Callbacks ***/
+
+static void fcp_notify(struct urb *urb)
+{
+	struct usb_mixer_interface *mixer = urb->context;
+	struct fcp_data *private = mixer->private_data;
+	int len = urb->actual_length;
+	int ustatus = urb->status;
+	u32 data;
+
+	if (ustatus != 0 || len != 8)
+		goto requeue;
+
+	data = le32_to_cpu(*(__le32 *)urb->transfer_buffer);
+
+	/* Handle command acknowledgement */
+	if (data & FCP_NOTIFY_ACK) {
+		complete(&private->cmd_done);
+		data &= ~FCP_NOTIFY_ACK;
+	}
+
+	if (data) {
+		unsigned long flags;
+
+		spin_lock_irqsave(&private->notify.lock, flags);
+		private->notify.event |= data;
+		spin_unlock_irqrestore(&private->notify.lock, flags);
+
+		wake_up_interruptible(&private->notify.queue);
+	}
+
+requeue:
+	if (ustatus != -ENOENT &&
+	    ustatus != -ECONNRESET &&
+	    ustatus != -ESHUTDOWN) {
+		urb->dev = mixer->chip->dev;
+		usb_submit_urb(urb, GFP_ATOMIC);
+	} else {
+		complete(&private->cmd_done);
+	}
+}
+
+/* Submit a URB to receive notifications from the device */
+static int fcp_init_notify(struct usb_mixer_interface *mixer)
+{
+	struct usb_device *dev = mixer->chip->dev;
+	struct fcp_data *private = mixer->private_data;
+	unsigned int pipe = usb_rcvintpipe(dev, private->bEndpointAddress);
+	void *transfer_buffer;
+	int err;
+
+	/* Already set up */
+	if (mixer->urb)
+		return 0;
+
+	if (usb_pipe_type_check(dev, pipe))
+		return -EINVAL;
+
+	mixer->urb = usb_alloc_urb(0, GFP_KERNEL);
+	if (!mixer->urb)
+		return -ENOMEM;
+
+	transfer_buffer = kmalloc(private->wMaxPacketSize, GFP_KERNEL);
+	if (!transfer_buffer) {
+		usb_free_urb(mixer->urb);
+		mixer->urb = NULL;
+		return -ENOMEM;
+	}
+
+	usb_fill_int_urb(mixer->urb, dev, pipe,
+			 transfer_buffer, private->wMaxPacketSize,
+			 fcp_notify, mixer, private->bInterval);
+
+	init_completion(&private->cmd_done);
+
+	err = usb_submit_urb(mixer->urb, GFP_KERNEL);
+	if (err) {
+		usb_audio_err(mixer->chip,
+			      "%s: usb_submit_urb failed: %d\n",
+			      __func__, err);
+		kfree(transfer_buffer);
+		usb_free_urb(mixer->urb);
+		mixer->urb = NULL;
+	}
+
+	return err;
+}
+
+/*** Initialisation ***/
+
+static int fcp_init(struct usb_mixer_interface *mixer,
+		    void *step0_resp, void *step2_resp)
+{
+	struct fcp_data *private = mixer->private_data;
+	struct usb_device *dev = mixer->chip->dev;
+	int err;
+
+	err = snd_usb_ctl_msg(dev, usb_rcvctrlpipe(dev, 0),
+		FCP_USB_REQ_STEP0,
+		USB_RECIP_INTERFACE | USB_TYPE_CLASS | USB_DIR_IN,
+		0, private->bInterfaceNumber, step0_resp, private->step0_size);
+	if (err < 0)
+		return err;
+
+	err = fcp_init_notify(mixer);
+	if (err < 0)
+		return err;
+
+	private->seq = 0;
+	private->init = 1;
+
+	err = fcp_usb(mixer, private->init1_opcode, NULL, 0, NULL, 0);
+	if (err < 0)
+		return err;
+
+	err = fcp_usb(mixer, private->init2_opcode,
+		      NULL, 0, step2_resp, private->step2_size);
+	if (err < 0)
+		return err;
+
+	return 0;
+}
+
+static int fcp_init_private(struct usb_mixer_interface *mixer)
+{
+	struct fcp_data *private =
+		kzalloc(sizeof(struct fcp_data), GFP_KERNEL);
+
+	if (!private)
+		return -ENOMEM;
+
+	mutex_init(&private->mutex);
+	init_waitqueue_head(&private->notify.queue);
+	spin_lock_init(&private->notify.lock);
+
+	mixer->private_data = private;
+	mixer->private_free = fcp_private_free;
+	mixer->private_suspend = fcp_private_suspend;
+
+	private->mixer = mixer;
+
+	return 0;
+}
+
+/* Look through the interface descriptors for the Focusrite Control
+ * interface (bInterfaceClass = 255 Vendor Specific Class) and set
+ * bInterfaceNumber, bEndpointAddress, wMaxPacketSize, and bInterval
+ * in private
+ */
+static int fcp_find_fc_interface(struct usb_mixer_interface *mixer)
+{
+	struct snd_usb_audio *chip = mixer->chip;
+	struct fcp_data *private = mixer->private_data;
+	struct usb_host_config *config = chip->dev->actconfig;
+	int i;
+
+	for (i = 0; i < config->desc.bNumInterfaces; i++) {
+		struct usb_interface *intf = config->interface[i];
+		struct usb_interface_descriptor *desc =
+			&intf->altsetting[0].desc;
+		struct usb_endpoint_descriptor *epd;
+
+		if (desc->bInterfaceClass != 255)
+			continue;
+
+		epd = get_endpoint(intf->altsetting, 0);
+		private->bInterfaceNumber = desc->bInterfaceNumber;
+		private->bEndpointAddress = epd->bEndpointAddress &
+			USB_ENDPOINT_NUMBER_MASK;
+		private->wMaxPacketSize = le16_to_cpu(epd->wMaxPacketSize);
+		private->bInterval = epd->bInterval;
+		return 0;
+	}
+
+	usb_audio_err(chip, "Focusrite vendor-specific interface not found\n");
+	return -EINVAL;
+}
+
+int snd_fcp_init(struct usb_mixer_interface *mixer)
+{
+	struct snd_usb_audio *chip = mixer->chip;
+	int err;
+
+	/* only use UAC_VERSION_2 */
+	if (!mixer->protocol)
+		return 0;
+
+	err = fcp_init_private(mixer);
+	if (err < 0)
+		return err;
+
+	err = fcp_find_fc_interface(mixer);
+	if (err < 0)
+		return err;
+
+	err = fcp_hwdep_init(mixer);
+	if (err < 0)
+		return err;
+
+	usb_audio_info(chip,
+		"Focusrite Control Protocol Driver ready (pid=0x%04x); "
+		"report any issues to "
+		"https://github.com/geoffreybennett/fcp-support/issues",
+		USB_ID_PRODUCT(chip->usb_id));
+
+	return err;
+}
diff --git a/sound/usb/fcp.h b/sound/usb/fcp.h
new file mode 100644
index 000000000000..d58cc7db75b1
--- /dev/null
+++ b/sound/usb/fcp.h
@@ -0,0 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __USBAUDIO_FCP_H
+#define __USBAUDIO_FCP_H
+
+int snd_fcp_init(struct usb_mixer_interface *mixer);
+
+#endif /* __USBAUDIO_FCP_H */
diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index a95ebcf4e46e..150fbb5ac7ed 100644
--- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -38,6 +38,7 @@
 #include "mixer_us16x08.h"
 #include "mixer_s1810c.h"
 #include "helper.h"
+#include "fcp.h"
 
 struct std_mono_table {
 	unsigned int unitid, control, cmask;
@@ -4033,6 +4034,12 @@ int snd_usb_mixer_apply_create_quirk(struct usb_mixer_interface *mixer)
 		err = snd_scarlett2_init(mixer);
 		break;
 
+	case USB_ID(0x1235, 0x821b): /* Focusrite Scarlett 16i16 4th Gen */
+	case USB_ID(0x1235, 0x821c): /* Focusrite Scarlett 18i16 4th Gen */
+	case USB_ID(0x1235, 0x821d): /* Focusrite Scarlett 18i20 4th Gen */
+		err = snd_fcp_init(mixer);
+		break;
+
 	case USB_ID(0x041e, 0x323b): /* Creative Sound Blaster E1 */
 		err = snd_soundblaster_e1_switch_create(mixer);
 		break;
-- 
2.45.0

