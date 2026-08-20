Received: from gw.d.sender-sib.com (gw.d.sender-sib.com [77.32.148.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4156F3DEAD3
	for <linux-sound@vger.kernel.org>; Thu, 20 Aug 2026 08:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.32.148.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787215028; cv=none; b=Pfhyy8FLJ8B+PFTVLZXmilf7mg07qsrrLjUivbsXZnuDFoUioK1yXlShxPmERatAf4Mxom21ItggdthKZSb/xjTx1lY6x0q/SynzLeT87fPPPqVNJz88yGHEpSoLDw99uI4j6aj9pUJN9/CYRrSMWGgqhPVaFjmx1OQ7kffp95k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787215028; c=relaxed/simple;
	bh=NcbhwLAR452+XvdRPu53gH0SXHNPejtgJFMlmBUEUo0=;
	h=Message-Id:Cc:From:To:Date:Subject:Mime-Version:In-Reply-To:
	 References; b=tV2+jn9SIpfpEo2qCF2Q6UvGbnSRP1e97f1HdVjUflcAP0g/UF0o7Xaqf3ZjmNwSJJP70HOWYclqi9cj05uUvgeyniv0apQmwkGijch3RKRDW7r0TcPpSnO7Kn1/ASbk2aLKLeC5Rw2H1z569ldJ22q+96/jEH68S2KkOzZHv6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=outlook.com.au; spf=pass smtp.mailfrom=gw.d.sender-sib.com; dkim=pass (1024-bit key) header.d=brevosend.com header.i=@brevosend.com header.b=sMN+bhAS; arc=none smtp.client-ip=77.32.148.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=outlook.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gw.d.sender-sib.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=brevosend.com header.i=@brevosend.com header.b="sMN+bhAS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=brevosend.com;
 q=dns/txt; s=mail; bh=7gGXA2sZcdKGoMeu5oE8WrsgkY0h5aX6naaukRKbxyo=;
 h=from:subject:date:to:cc:mime-version:content-transfer-encoding:in-reply-to:references:list-unsubscribe:x-csa-complaints:list-unsubscribe-post:message-id:x-sib-id:feedback-id;
        b=sMN+bhASwqCFOjw06XAuqq2OCUV2Xc466+xSwwcQRvg84CeutQ8B47p6NnnyoHgD+mh40t5d3321
        W0KRTKNJDzZocr1w7yS+1mQZiLQ3qgwC3BFAE10E7CRPRGt93pK+dsxuc/gWRD+NOApuWnONRkOs
        gnYPr2mLExQN7w/iLrE=
X-sib-id: IFpz14rPlwK5XS4dwnVkKt_ksuHCAmvNOBIN_9lqZERTl1fpG3qQjVODXh0P-J8PN4w1xNDgcYANPbNeuHEZ_UUjbqOFgaQwRwBM2DUxXhZIP5GRbmttSsbmCJMiH7O3V2ythvKFhCFNRb1idXRLJ9KDRiGHSefZX8IA8lFnXbEStPtHyfgFHtuE
Message-Id: <20260820083646.11383-2-nicholas.johnson-opensource@outlook.com.au>
Origin-messageId: <20260820083646.11383-2-nicholas.johnson-opensource@outlook.com.au>
Cc: "Jonathan Corbet" <corbet@lwn.net>,  "Shuah Khan" <skhan@linuxfoundation.org>,  <linux-sound@vger.kernel.org>,  <linux-doc@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,  "Nicholas Johnson" <nicholas.johnson-opensource@outlook.com.au>
List-Unsubscribe-Post: List-Unsubscribe=One-Click
Feedback-ID: 77.32.148.23:11519862_-1:11519862:Sendinblue
From: "Nicholas Johnson" <nicholas.johnson-opensource@outlook.com.au>
X-CSA-Complaints: csa-complaints@eco.de
X-Mailin-EID: NDgxMTkzNjAyfmxpbnV4LXNvdW5kQHZnZXIua2VybmVsLm9yZ348MjAyNjA4MjAwODM2NDYuMTEzODMtMi1uaWNob2xhcy5qb2huc29uLW9wZW5zb3VyY2VAb3V0bG9vay5jb20uYXU%2Bfmd3LmQuc2VuZGVyLXNpYi5jb20%3D
To: "Jaroslav Kysela" <perex@perex.cz>,"Takashi Iwai" <tiwai@suse.com>
Date: Thu, 20 Aug 2026 16:36:46 +0800
Subject: [RFC PATCH 1/1] ALSA: pci: add PreSonus Quantum PCI driver
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260820083646.11383-1-nicholas.johnson-opensource@outlook.com.au>
Content-Transfer-Encoding: quoted-printable
References: <20260820083646.11383-1-nicholas.johnson-opensource@outlook.com.au>


Add an ALSA PCI driver for PreSonus Quantum PCIe/Thunderbolt audio
interfaces.

This project is independent and is not affiliated with PreSonus or Fender.

This driver provides playback, capture, raw MIDI, sample-rate control,
clock-source control, XRUN reporting, and surprise-removal handling for the
Quantum PCI family. It uses the device DMA engine directly and keeps the
hardware-visible path aligned with the native multichannel layout.

Only the Quantum 2626 is matched at present, as it is the only model
verified by the driver author.

Thank you to my best friend, Ju Ern, for lending the machine used to
develop this driver. Thank you to the Asahi Linux project for m1n1 and for
the tooling and documentation that made low-level hardware analysis
possible.

Signed-off-by: Nicholas Johnson <nicholas.johnson-opensource@outlook.com.au=
>
---
 Documentation/sound/cards/index.rst           |    1 +
 .../sound/cards/presonus-quantum.rst          |  120 ++
 MAINTAINERS                                   |    6 +
 sound/pci/Kconfig                             |    2 +
 sound/pci/Makefile                            |    1 +
 sound/pci/quantum/Kconfig                     |   19 +
 sound/pci/quantum/Makefile                    |    6 +
 sound/pci/quantum/quantum.h                   |  394 ++++++
 sound/pci/quantum/quantum_dma.c               |  853 ++++++++++++
 sound/pci/quantum/quantum_main.c              | 1148 +++++++++++++++++
 sound/pci/quantum/quantum_midi.c              |  180 +++
 sound/pci/quantum/quantum_mixer.c             |  214 +++
 sound/pci/quantum/quantum_pcm.c               |  609 +++++++++
 sound/pci/quantum/quantum_regs.h              |   52 +
 sound/pci/quantum/quantum_tci.c               |  486 +++++++
 15 files changed, 4091 insertions(+)
 create mode 100644 Documentation/sound/cards/presonus-quantum.rst
 create mode 100644 sound/pci/quantum/Kconfig
 create mode 100644 sound/pci/quantum/Makefile
 create mode 100644 sound/pci/quantum/quantum.h
 create mode 100644 sound/pci/quantum/quantum_dma.c
 create mode 100644 sound/pci/quantum/quantum_main.c
 create mode 100644 sound/pci/quantum/quantum_midi.c
 create mode 100644 sound/pci/quantum/quantum_mixer.c
 create mode 100644 sound/pci/quantum/quantum_pcm.c
 create mode 100644 sound/pci/quantum/quantum_regs.h
 create mode 100644 sound/pci/quantum/quantum_tci.c

diff --git a/Documentation/sound/cards/index.rst b/Documentation/sound/card=
s/index.rst
index e68bbb13c..1595a41f5 100644
--- a/Documentation/sound/cards/index.rst
+++ b/Documentation/sound/cards/index.rst
@@ -19,3 +19,4 @@ Card-Specific Information
    serial-u16550
    img-spdif-in
    pcmtest
+   presonus-quantum
diff --git a/Documentation/sound/cards/presonus-quantum.rst b/Documentation=
/sound/cards/presonus-quantum.rst
new file mode 100644
index 000000000..c8369d3c7
--- /dev/null
+++ b/Documentation/sound/cards/presonus-quantum.rst
@@ -0,0 +1,120 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. Copyright (C) 2026 Nicholas Johnson
+
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
+PreSonus Quantum PCI Driver
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
+
+The ``snd-quantum`` driver supports PreSonus Quantum PCIe/Thunderbolt audi=
o
+interfaces through ALSA. The Quantum 2626 is enabled by default and is the
+only model verified by the driver author.
+
+Other related Quantum PCI devices are not currently matched by this driver=
.
+
+Supported Features
+------------------
+
+The driver provides:
+
+* 26-channel PCM playback and capture using the native ``S32_LE`` hardware
+  format;
+* raw MIDI input and output;
+* sample-rate selection from 44100 Hz to 192000 Hz;
+* clock-source selection for internal, S/PDIF, word clock, ADAT1, and ADAT=
2;
+* playback and capture XRUN counters.
+
+The hardware has a shared audio DMA engine, so playback and capture run wi=
th
+the same sample rate, period size, and buffer size while both directions a=
re
+active.
+
+Loading
+-------
+
+Load the driver with::
+
+    # modprobe snd-quantum
+
+Check that ALSA registered the card with::
+
+    $ cat /proc/asound/cards
+    $ aplay -l
+    $ arecord -l
+
+ALSA Controls
+-------------
+
+The sample rate and clock source are exposed as ALSA mixer controls. The c=
ard
+identifier normally appears as ``Quantum2626``.
+
+For example::
+
+    $ amixer -c Quantum2626 cset name=3D'Quantum Sample Rate' 48000
+    $ amixer -c Quantum2626 cset name=3D'Quantum Clock Source' Internal
+
+XRUN counters can be read with::
+
+    $ amixer -c Quantum2626 cget name=3D'Quantum Playback XRUN Count'
+    $ amixer -c Quantum2626 cget name=3D'Quantum Capture XRUN Count'
+
+Audio Testing
+-------------
+
+Test playback on the first channel with::
+
+    $ speaker-test -D hw:Quantum2626,0 -F S32_LE -r 48000 -c 26 -s 1 -t si=
ne -l 1
+
+Record all capture channels with::
+
+    $ arecord -D hw:Quantum2626,0 -f S32_LE -r 48000 -c 26 -d 10 /tmp/quan=
tum.wav
+
+The ALSA device exposes the native multichannel hardware stream. Stereo
+mixing and speaker routing are expected to be handled by ALSA, PipeWire, J=
ACK,
+or the application using the device.
+
+CPU Latency QoS
+---------------
+
+Low-latency audio can be sensitive to CPU idle-exit latency. While audio D=
MA
+is active, the driver can hold a per-device CPU latency QoS request. The
+request is removed when audio DMA stops.
+
+The default configured latency is 2 microseconds. When automatic low-laten=
cy
+mode is enabled, the effective request becomes 0 microseconds for the tigh=
test
+hardware service intervals.
+
+The controls are exposed below the PCI device, for example::
+
+    /sys/bus/pci/devices/0000:08:00.0/cpu_latency_us
+    /sys/bus/pci/devices/0000:08:00.0/cpu_latency_auto_low_latency
+    /sys/bus/pci/devices/0000:08:00.0/cpu_latency_effective_us
+    /sys/bus/pci/devices/0000:08:00.0/cpu_latency_state
+
+``cpu_latency_us``
+    Configured latency request in microseconds. Use ``0`` for the stronges=
t
+    constraint, or ``-1`` to disable the request.
+
+``cpu_latency_auto_low_latency``
+    Boolean control for automatically tightening the request when the sele=
cted
+    sample rate and period size require the shortest service interval.
+
+``cpu_latency_effective_us``
+    Read-only value showing the latency request that would be applied for =
the
+    current stream configuration. ``-1`` means disabled.
+
+``cpu_latency_state``
+    Read-only summary of the configured value, effective value, automatic =
mode,
+    DMA-active state, sample rate, hardware quantum, period size, and buff=
er
+    size.
+
+Example::
+
+    $ cat /sys/bus/pci/devices/0000:08:00.0/cpu_latency_state
+    # echo 0 > /sys/bus/pci/devices/0000:08:00.0/cpu_latency_us
+    # echo -1 > /sys/bus/pci/devices/0000:08:00.0/cpu_latency_us
+
+Limitations
+-----------
+
+Only the Quantum 2626 has been verified by the driver author. Later
+Quantum-branded USB interfaces use a different hardware architecture and a=
re
+not supported by this driver.
diff --git a/MAINTAINERS b/MAINTAINERS
index a674e3652..499a393d8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21604,6 +21604,12 @@ S:	Maintained
 F:	include/linux/psi*
 F:	kernel/sched/psi.c
=20
+PRESONUS QUANTUM PCI SOUND DRIVER
+M:	Nicholas Johnson <nicholas.johnson-opensource@outlook.com.au>
+L:	linux-sound@vger.kernel.org
+S:	Maintained
+F:	sound/pci/quantum/
+
 PROPELLER BUILD
 M:	Rong Xu <xur@google.com>
 M:	Han Shen <shenhan@google.com>
diff --git a/sound/pci/Kconfig b/sound/pci/Kconfig
index e0996a9d9..c4ef2e14a 100644
--- a/sound/pci/Kconfig
+++ b/sound/pci/Kconfig
@@ -778,6 +778,8 @@ config SND_PCXHR
 	  To compile this driver as a module, choose M here: the module
 	  will be called snd-pcxhr.
=20
+source "sound/pci/quantum/Kconfig"
+
 config SND_RIPTIDE
 	tristate "Conexant Riptide"
 	depends on HAS_IOPORT
diff --git a/sound/pci/Makefile b/sound/pci/Makefile
index 9d5e8e12a..f18d38e97 100644
--- a/sound/pci/Makefile
+++ b/sound/pci/Makefile
@@ -54,6 +54,7 @@ obj-$(CONFIG_SND_SIS7019) +=3D snd-sis7019.o
 obj-$(CONFIG_SND_SONICVIBES) +=3D snd-sonicvibes.o
 obj-$(CONFIG_SND_VIA82XX) +=3D snd-via82xx.o
 obj-$(CONFIG_SND_VIA82XX_MODEM) +=3D snd-via82xx-modem.o
+obj-$(CONFIG_SND_QUANTUM) +=3D quantum/
=20
 obj-$(CONFIG_SND) +=3D \
 	ac97/ \
diff --git a/sound/pci/quantum/Kconfig b/sound/pci/quantum/Kconfig
new file mode 100644
index 000000000..96cd9ae7b
--- /dev/null
+++ b/sound/pci/quantum/Kconfig
@@ -0,0 +1,19 @@
+config SND_QUANTUM
+	tristate "PreSonus Quantum PCI sound driver"
+	depends on SND_PCI
+	select SND_PCM
+	select SND_RAWMIDI
+	help
+	  Say Y or M here to include support for PreSonus Quantum series
+	  PCI over Thunderbolt sound cards.
+
+	  The supported devices are professional audio interfaces with
+	  multichannel playback and capture, raw MIDI, sample-rate control,
+	  and clock-source control.
+
+	  This driver is independent and is not affiliated with PreSonus
+	  or Fender. Later Quantum-branded USB interfaces are not supported
+	  by this driver, as they use a different hardware architecture.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called snd-quantum.
diff --git a/sound/pci/quantum/Makefile b/sound/pci/quantum/Makefile
new file mode 100644
index 000000000..58d81abc5
--- /dev/null
+++ b/sound/pci/quantum/Makefile
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0
+
+snd-quantum-y :=3D quantum_main.o quantum_dma.o quantum_midi.o \
+                 quantum_mixer.o quantum_pcm.o quantum_tci.o
+
+obj-$(CONFIG_SND_QUANTUM) +=3D snd-quantum.o
diff --git a/sound/pci/quantum/quantum.h b/sound/pci/quantum/quantum.h
new file mode 100644
index 000000000..822c1f40e
--- /dev/null
+++ b/sound/pci/quantum/quantum.h
@@ -0,0 +1,394 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright (C) 2026 Nicholas Johnson */
+#ifndef QUANTUM_H
+#define QUANTUM_H
+
+#include <linux/atomic.h>
+#include <linux/completion.h>
+#include <linux/delay.h>
+#include <linux/dma-mapping.h>
+#include <linux/fs.h>
+#include <linux/interrupt.h>
+#include <linux/jiffies.h>
+#include <linux/mm.h>
+#include <linux/mutex.h>
+#include <linux/pci.h>
+#include <linux/pm_qos.h>
+#include <linux/slab.h>
+#include <linux/smp.h>
+#include <linux/spinlock.h>
+#include <linux/workqueue.h>
+
+#include <sound/control.h>
+#include <sound/core.h>
+#include <sound/initval.h>
+#include <sound/pcm.h>
+#include <sound/rawmidi.h>
+
+#include "quantum_regs.h"
+
+/*
+ * The hardware's actual DMA service granularity is fixed by rate, not by
+ * whatever period size ALSA negotiated: the FPGA runs a constant base
+ * quantum at <=3D48kHz and doubles/quadruples it at higher rates to hold
+ * the same service interval in wall-clock time. Feeding it the raw ALSA
+ * period size instead (e.g. 32 frames at 192kHz, where the real block
+ * size is 4*32=3D128) is out of spec for the hardware and has been
+ * observed to raise IOMMU faults and hang the machine.
+ */
+#define QUANTUM_BASE_HW_QUANTUM 32
+
+static inline unsigned int quantum_hw_quantum(unsigned int rate,
+					      unsigned int base_frames)
+{
+	(void)base_frames;
+
+	if (rate > 96000)
+		return QUANTUM_BASE_HW_QUANTUM * 4;
+	if (rate > 48000)
+		return QUANTUM_BASE_HW_QUANTUM * 2;
+	return QUANTUM_BASE_HW_QUANTUM;
+}
+
+/* TCI protocol definitions */
+
+#define TCI_CHAN_CMD_RESP      0x01
+#define TCI_CHAN_CMD_EVENT     0x02
+#define TCI_CHAN_MIDI_TX       0x11
+#define TCI_CHAN_MIDI_RX       0x12
+#define TCI_CHAN_CTRL          0x31
+#define TCI_CHAN_CTRL_EVENT    0x32
+
+/* Generic status reply, shared across TCI_CHAN_CMD_RESP and TCI_CHAN_CTRL=
 */
+#define TCI_RSP_STATUS         0x01
+
+/* TCI_CHAN_CMD_RESP */
+#define TCI_RSP_PARAMS         0x04
+#define TCI_CMD_GET_PARAMS     0x07
+#define TCI_CMD_SET_PARAMS     0x08
+#define TCI_CMD_LOOPBACK       0x11
+#define TCI_RSP_LOOPBACK       0x12
+
+/* TCI_CHAN_CMD_EVENT */
+#define TCI_CMD_EVENT_PARAMS   0x09
+
+/* TCI_CHAN_MIDI_TX / TCI_CHAN_MIDI_RX */
+#define TCI_CMD_MIDI_TX        0x41
+#define TCI_RSP_MIDI_TX        0x42
+#define TCI_EVT_MIDI_RX        0x43
+#define TCI_EVT_MIDI_TX_FREE   0x44
+
+/* TCI_CHAN_CTRL */
+#define TCI_CTRL_GET_SAMPLE_RATE    0x31
+#define TCI_CTRL_SET_SAMPLE_RATE    0x32
+#define TCI_CTRL_GET_CLOCK_SOURCE   0x33
+#define TCI_CTRL_SET_CLOCK_SOURCE   0x34
+#define TCI_CTRL_RSP_SAMPLE_RATE    0x35
+#define TCI_CTRL_RSP_CLOCK_SOURCE   0x36
+#define TCI_CTRL_SET_SERIAL_NUMBER  0x38
+#define TCI_CTRL_GET_SERIAL_NUMBER  0x39
+#define TCI_CTRL_RSP_SERIAL_NUMBER  0x3a
+#define TCI_CTRL_GET_POWER_STATE    0x3b
+#define TCI_CTRL_RSP_POWER_STATE    0x3c
+#define TCI_CTRL_GET_LATENCY        0x3d
+#define TCI_CTRL_RSP_LATENCY        0x3e
+
+/* TCI_CHAN_CTRL_EVENT */
+#define TCI_EVT_CLOCK_STATUS        0x33
+#define TCI_EVT_POWER_STATE         0x34
+
+enum quantum_clk_source {
+	CLK_SOURCE_INTERNAL =3D 0,
+	CLK_SOURCE_EXTERNAL_SPDIF =3D 1,
+	CLK_SOURCE_EXTERNAL_WORD_CLOCK =3D 2,
+	CLK_SOURCE_EXTERNAL_ADAT1 =3D 3,
+	CLK_SOURCE_EXTERNAL_ADAT2 =3D 4,
+};
+
+struct tci_header {
+	__le16 length;
+	u8 channel;
+	u8 code;
+	__le16 tid;
+	__le16 reserved;
+} __packed;
+
+/* DMA structures */
+
+struct quantum_dma_page {
+	void *cpu_addr;
+	dma_addr_t dma_handle;
+};
+
+struct quantum_page_table {
+	dma_addr_t dma_handle;
+	void *cpu_addr;
+	size_t size;
+	u32 num_entries;
+	u32 num_segments;
+	u32 addr_per_segment;
+	struct quantum_dma_page *pages;
+};
+
+/* Stream state */
+
+struct quantum_stream {
+	bool valid;
+	bool owns_pages;
+	u32 channels;
+	size_t buffer_bytes;
+	struct quantum_page_table *pt;
+	struct quantum_page_table pt_storage;
+	struct quantum_dma_page *pages;
+	u32 num_pages;
+};
+
+/* TCI command tracking */
+
+struct quantum_tci_cmd {
+	u16 tid;
+	int status;
+	bool responded;
+	u8 response_code;
+	u8 response_data[256];
+	size_t response_len;
+	struct completion done;
+	struct list_head list;
+};
+
+/* Main device state */
+
+#define QUANTUM_MAX_CMD_SLOTS 8
+
+struct quantum_chip {
+	struct snd_card *card;
+	struct pci_dev *pci;
+	void __iomem *iobase;
+	const char *model_id;
+	const char *model_name;
+
+	/* Index into index[]/id[]/enable[]; see quantum_release_card_slot(). */
+	int card_slot;
+
+	atomic_t pending_interrupts;
+
+	int irq;
+	bool irq_requested;
+	bool msi_allocated;
+
+	/* Deferred command processing */
+	struct workqueue_struct *cmd_wq;
+
+	struct work_struct cmd_work;
+	struct work_struct midi_tx_work;
+
+	/* PCM */
+	struct snd_pcm *pcm;
+	struct snd_pcm_substream *playback_substream;
+	struct snd_pcm_substream *capture_substream;
+	struct snd_pcm_substream *playback_configured_substream;
+	struct snd_pcm_substream *capture_configured_substream;
+	u8 pcm_configured;
+	struct snd_rawmidi *rmidi;
+	struct snd_rawmidi_substream *midi_input;
+	struct snd_rawmidi_substream *midi_output;
+	bool midi_input_triggered;
+	bool midi_output_triggered;
+	/* Protects MIDI runtime substream state. */
+	spinlock_t midi_lock;
+	/* Serializes command and MIDI writes into the TCI TX ring. */
+	struct mutex tci_tx_mutex;
+
+	/* Audio DMA */
+	struct quantum_stream playback;
+	struct quantum_stream capture;
+
+	/* Command buffers */
+	void *cmd_tx_cpu;
+	void *cmd_rx_cpu;
+	dma_addr_t cmd_tx_dma_base;
+	dma_addr_t cmd_rx_dma_base;
+
+	void *cmd_tx_slots[QUANTUM_MAX_CMD_SLOTS];
+	dma_addr_t cmd_tx_dma[QUANTUM_MAX_CMD_SLOTS];
+	void *cmd_rx_slots[QUANTUM_MAX_CMD_SLOTS];
+	dma_addr_t cmd_rx_dma[QUANTUM_MAX_CMD_SLOTS];
+
+	u32 cmd_msg_count;
+	u32 cmd_msg_size;
+
+	/* Hardware configuration */
+	u32 addr_per_segment_rec, addr_per_segment_play;
+
+	/* State */
+	u32 sample_rate;
+	u32 clock_source;
+	bool powered_on;
+	bool stream_active;
+	bool dma_resources_allocated;
+	struct pm_qos_request cpu_latency_qos;
+	int cpu_latency_us;
+	bool cpu_latency_auto_low_latency;
+
+	/* DMA position tracking */
+	u32 last_dma_pos;
+	bool dma_position_valid;
+	u32 dma_cycle_count;
+	u32 period_frames;
+	u32 buffer_frames;
+	u32 current_sample_rate;
+	u32 dma_ring_frames;
+	u32 dma_quantum_frames;
+	u32 dma_elapsed_frames;
+	u32 dma_pending_frames;
+	/*
+	 * The hardware exposes one shared free-running DMA position for both
+	 * directions.  ALSA may restart one substream while the other keeps the
+	 * engine running, so defer wakeups for the restarted substream until the
+	 * shared ring naturally reaches frame zero again.
+	 */
+	bool playback_attach_pending;
+	bool capture_attach_pending;
+	u32 playback_period_accum;
+	u32 capture_period_accum;
+	u64 playback_xruns;
+	u64 capture_xruns;
+
+	/* TCI command tracking */
+	u16 next_tid;
+	struct list_head pending_cmds;
+	/* Protects pending_cmds and command completion state. */
+	spinlock_t cmd_lock;
+
+	/* TCI readiness */
+	bool tci_initialized;
+	bool tci_ready;
+
+	/* State bits */
+	unsigned long device_gone;
+	bool removing;
+	bool tci_fatal_error;
+	bool resources_released;
+	unsigned long sysfs_removed;
+
+	/* Serial number */
+	u8 serial[32];
+
+	/* DMA preparation flag */
+	bool dma_prepared;
+
+	/* Locks */
+	struct mutex dma_mutex;
+	bool async_quiesced;
+};
+
+/* MMIO helpers */
+
+static inline bool quantum_device_removed(struct quantum_chip *chip)
+{
+	return !chip || !chip->pci ||
+	       test_bit(0, &chip->device_gone) ||
+	       READ_ONCE(chip->resources_released) ||
+	       pci_dev_is_disconnected(chip->pci);
+}
+
+static inline bool quantum_device_gone(struct quantum_chip *chip)
+{
+	return quantum_device_removed(chip) || READ_ONCE(chip->removing);
+}
+
+/*
+ * Returns the current iobase, or NULL if unavailable, reading chip->iobas=
e
+ * exactly once. quantum_read32()/quantum_write32() use only this returned
+ * value; checking chip->iobase and separately dereferencing it is a
+ * check-then-use race against snd_quantum_release_resources() nulling it
+ * out from another thread between the two.
+ */
+static inline void __iomem *quantum_iobase_or_null(struct quantum_chip *ch=
ip)
+{
+	if (quantum_device_removed(chip))
+		return NULL;
+
+	return READ_ONCE(chip->iobase);
+}
+
+static inline bool quantum_device_unavailable(struct quantum_chip *chip)
+{
+	return !quantum_iobase_or_null(chip);
+}
+
+static inline u32 quantum_read32(struct quantum_chip *chip, u32 off)
+{
+	void __iomem *base =3D quantum_iobase_or_null(chip);
+
+	if (!base)
+		return U32_MAX;
+
+	return readl(base + off);
+}
+
+static inline void quantum_write32(struct quantum_chip *chip, u32 off, u32=
 val)
+{
+	void __iomem *base =3D quantum_iobase_or_null(chip);
+
+	if (!base)
+		return;
+
+	writel(val, base + off);
+}
+
+static inline void quantum_write32_mask(struct quantum_chip *chip, u32 off=
,
+					u32 mask, u32 val)
+{
+	u32 tmp =3D quantum_read32(chip, off);
+
+	if (tmp =3D=3D U32_MAX)
+		return;
+
+	tmp &=3D ~mask;
+	tmp |=3D val & mask;
+	quantum_write32(chip, off, tmp);
+}
+
+/* Cross-file interfaces */
+
+/* dma */
+int quantum_allocate_dma_resources(struct quantum_chip *chip,
+				   unsigned int sample_rate,
+				   unsigned int period_frames,
+				   unsigned int buffer_frames,
+				   struct snd_pcm_substream *playback_substream,
+				   struct snd_pcm_substream *capture_substream);
+void quantum_free_dma_resources(struct quantum_chip *chip);
+int quantum_start_dma(struct quantum_chip *chip);
+void quantum_stop_dma(struct quantum_chip *chip);
+void quantum_shutdown_audio_dma(struct quantum_chip *chip);
+int quantum_cpu_latency_sysfs_create(struct quantum_chip *chip);
+void quantum_cpu_latency_sysfs_remove(struct quantum_chip *chip);
+void quantum_update_dma_position(struct quantum_chip *chip);
+void quantum_transfer_audio(struct quantum_chip *chip);
+
+/* pcm */
+int snd_quantum_pcm_new(struct quantum_chip *chip);
+
+/* mixer */
+int quantum_mixer_new(struct quantum_chip *chip);
+
+/* tci */
+void quantum_process_rx_messages(struct quantum_chip *chip);
+int quantum_tci_send_midi(struct quantum_chip *chip, const u8 *data, size_=
t len);
+
+/* MIDI */
+int quantum_midi_new(struct quantum_chip *chip);
+void quantum_midi_receive(struct quantum_chip *chip, const u8 *payload,
+			  size_t payload_len);
+void quantum_midi_tx_work_handler(struct work_struct *work);
+int quantum_set_sample_rate(struct quantum_chip *chip, unsigned int rate);
+int quantum_set_clock_source(struct quantum_chip *chip, unsigned int sourc=
e);
+int quantum_get_clock_source(struct quantum_chip *chip, unsigned int *sour=
ce);
+int quantum_get_serial_number(struct quantum_chip *chip);
+
+/* power */
+void quantum_power_state_changed(struct quantum_chip *chip, bool powered_o=
n);
+
+#endif
diff --git a/sound/pci/quantum/quantum_dma.c b/sound/pci/quantum/quantum_dm=
a.c
new file mode 100644
index 000000000..8d56c2980
--- /dev/null
+++ b/sound/pci/quantum/quantum_dma.c
@@ -0,0 +1,853 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright (C) 2026 Nicholas Johnson */
+#include <linux/module.h>
+
+#include "quantum.h"
+
+#define QUANTUM_FPGA_PAGE_SIZE 4096U
+#define QUANTUM_PT_WORDS       (QUANTUM_FPGA_PAGE_SIZE / sizeof(__le64))
+#define QUANTUM_DEFAULT_CPU_LATENCY_US 2
+
+/*
+ * The hardware's real-time service interval is quantum/rate, held roughly
+ * constant across rates by quantum_hw_quantum() -- 32 frames at 48kHz is
+ * exactly as tight (~667us) as 128 frames at 192kHz. Compare against that
+ * interval directly, cross-multiplied to stay in integer arithmetic,
+ * rather than hardcoding the one rate this used to only ever apply to.
+ */
+static bool quantum_needs_low_latency(struct quantum_chip *chip)
+{
+	return (u64)chip->dma_quantum_frames * 48000 <=3D
+	       (u64)QUANTUM_BASE_HW_QUANTUM * chip->current_sample_rate;
+}
+
+static int quantum_effective_cpu_latency_us(struct quantum_chip *chip)
+{
+	if (chip->cpu_latency_us < 0)
+		return chip->cpu_latency_us;
+
+	if (chip->cpu_latency_auto_low_latency &&
+	    quantum_needs_low_latency(chip))
+		return 0;
+
+	return chip->cpu_latency_us;
+}
+
+static void quantum_cpu_latency_qos_apply(struct quantum_chip *chip)
+{
+	int latency_us =3D quantum_effective_cpu_latency_us(chip);
+
+	if (latency_us < 0) {
+		if (cpu_latency_qos_request_active(&chip->cpu_latency_qos))
+			cpu_latency_qos_remove_request(&chip->cpu_latency_qos);
+		return;
+	}
+
+	if (cpu_latency_qos_request_active(&chip->cpu_latency_qos))
+		cpu_latency_qos_update_request(&chip->cpu_latency_qos,
+					       latency_us);
+	else
+		cpu_latency_qos_add_request(&chip->cpu_latency_qos,
+					    latency_us);
+}
+
+static void quantum_cpu_latency_qos_enable(struct quantum_chip *chip)
+{
+	quantum_cpu_latency_qos_apply(chip);
+}
+
+static void quantum_cpu_latency_qos_disable(struct quantum_chip *chip)
+{
+	if (!cpu_latency_qos_request_active(&chip->cpu_latency_qos))
+		return;
+
+	cpu_latency_qos_remove_request(&chip->cpu_latency_qos);
+}
+
+static ssize_t cpu_latency_us_show(struct device *dev,
+				   struct device_attribute *attr, char *buf)
+{
+	struct snd_card *card =3D dev_get_drvdata(dev);
+	struct quantum_chip *chip;
+
+	if (!card)
+		return -ENODEV;
+
+	chip =3D card->private_data;
+
+	return sysfs_emit(buf, "%d\n", chip->cpu_latency_us);
+}
+
+static ssize_t cpu_latency_us_store(struct device *dev,
+				    struct device_attribute *attr,
+				    const char *buf, size_t count)
+{
+	struct snd_card *card =3D dev_get_drvdata(dev);
+	struct quantum_chip *chip;
+	int value;
+	int err;
+
+	if (!card)
+		return -ENODEV;
+
+	err =3D kstrtoint(buf, 0, &value);
+	if (err)
+		return err;
+
+	chip =3D card->private_data;
+	mutex_lock(&chip->dma_mutex);
+	chip->cpu_latency_us =3D value;
+	if (READ_ONCE(chip->stream_active))
+		quantum_cpu_latency_qos_apply(chip);
+	mutex_unlock(&chip->dma_mutex);
+
+	return count;
+}
+static DEVICE_ATTR_RW(cpu_latency_us);
+
+static ssize_t cpu_latency_auto_low_latency_show(struct device *dev,
+						 struct device_attribute *attr,
+						 char *buf)
+{
+	struct snd_card *card =3D dev_get_drvdata(dev);
+	struct quantum_chip *chip;
+
+	if (!card)
+		return -ENODEV;
+
+	chip =3D card->private_data;
+
+	return sysfs_emit(buf, "%u\n", chip->cpu_latency_auto_low_latency);
+}
+
+static ssize_t cpu_latency_auto_low_latency_store(struct device *dev,
+						  struct device_attribute *attr,
+						  const char *buf, size_t count)
+{
+	struct snd_card *card =3D dev_get_drvdata(dev);
+	struct quantum_chip *chip;
+	bool value;
+	int err;
+
+	if (!card)
+		return -ENODEV;
+
+	err =3D kstrtobool(buf, &value);
+	if (err)
+		return err;
+
+	chip =3D card->private_data;
+	mutex_lock(&chip->dma_mutex);
+	chip->cpu_latency_auto_low_latency =3D value;
+	if (READ_ONCE(chip->stream_active))
+		quantum_cpu_latency_qos_apply(chip);
+	mutex_unlock(&chip->dma_mutex);
+
+	return count;
+}
+static DEVICE_ATTR_RW(cpu_latency_auto_low_latency);
+
+static ssize_t cpu_latency_effective_us_show(struct device *dev,
+					     struct device_attribute *attr,
+					     char *buf)
+{
+	struct snd_card *card =3D dev_get_drvdata(dev);
+	struct quantum_chip *chip;
+	int value;
+
+	if (!card)
+		return -ENODEV;
+
+	chip =3D card->private_data;
+	mutex_lock(&chip->dma_mutex);
+	value =3D quantum_effective_cpu_latency_us(chip);
+	mutex_unlock(&chip->dma_mutex);
+
+	return sysfs_emit(buf, "%d\n", value);
+}
+static DEVICE_ATTR_RO(cpu_latency_effective_us);
+
+static ssize_t cpu_latency_state_show(struct device *dev,
+				      struct device_attribute *attr,
+				      char *buf)
+{
+	struct snd_card *card =3D dev_get_drvdata(dev);
+	struct quantum_chip *chip;
+	int effective;
+	ssize_t count;
+
+	if (!card)
+		return -ENODEV;
+
+	chip =3D card->private_data;
+	mutex_lock(&chip->dma_mutex);
+	effective =3D quantum_effective_cpu_latency_us(chip);
+	count =3D sysfs_emit(buf,
+			   "configured_us=3D%d effective_us=3D%d auto_low_latency=3D%u active=
=3D%u rate=3D%u quantum=3D%u period=3D%u buffer=3D%u\n",
+			   chip->cpu_latency_us, effective,
+			   chip->cpu_latency_auto_low_latency,
+			   READ_ONCE(chip->stream_active) ? 1 : 0,
+			   chip->current_sample_rate, chip->dma_quantum_frames,
+			   chip->period_frames, chip->buffer_frames);
+	mutex_unlock(&chip->dma_mutex);
+
+	return count;
+}
+static DEVICE_ATTR_RO(cpu_latency_state);
+
+int quantum_cpu_latency_sysfs_create(struct quantum_chip *chip)
+{
+	int err;
+
+	chip->cpu_latency_us =3D QUANTUM_DEFAULT_CPU_LATENCY_US;
+	chip->cpu_latency_auto_low_latency =3D true;
+
+	err =3D device_create_file(&chip->pci->dev, &dev_attr_cpu_latency_us);
+	if (err)
+		return err;
+
+	err =3D device_create_file(&chip->pci->dev,
+				 &dev_attr_cpu_latency_auto_low_latency);
+	if (err)
+		goto err_remove_latency;
+
+	err =3D device_create_file(&chip->pci->dev,
+				 &dev_attr_cpu_latency_effective_us);
+	if (err)
+		goto err_remove_auto;
+
+	err =3D device_create_file(&chip->pci->dev, &dev_attr_cpu_latency_state);
+	if (err)
+		goto err_remove_effective;
+
+	return 0;
+
+err_remove_effective:
+	device_remove_file(&chip->pci->dev, &dev_attr_cpu_latency_effective_us);
+err_remove_auto:
+	device_remove_file(&chip->pci->dev,
+			   &dev_attr_cpu_latency_auto_low_latency);
+err_remove_latency:
+	device_remove_file(&chip->pci->dev, &dev_attr_cpu_latency_us);
+	return err;
+}
+
+void quantum_cpu_latency_sysfs_remove(struct quantum_chip *chip)
+{
+	/*
+	 * Must run exactly once, synchronously from remove(): these files
+	 * are attached to chip->pci->dev, which the PCI core deletes shortly
+	 * after remove() returns, racing a later device_remove_file() call
+	 * from the deferred private_free() path.
+	 */
+	if (test_and_set_bit(0, &chip->sysfs_removed))
+		return;
+
+	device_remove_file(&chip->pci->dev, &dev_attr_cpu_latency_state);
+	device_remove_file(&chip->pci->dev, &dev_attr_cpu_latency_effective_us);
+	device_remove_file(&chip->pci->dev,
+			   &dev_attr_cpu_latency_auto_low_latency);
+	device_remove_file(&chip->pci->dev, &dev_attr_cpu_latency_us);
+}
+
+/* Build a chained page table */
+
+static int quantum_build_page_table(struct quantum_chip *chip,
+				    struct quantum_page_table *pt,
+				    const struct quantum_stream *stream,
+				    struct snd_pcm_substream *substream,
+				    size_t audio_size,
+				    u32 addr_per_segment)
+{
+	u32 pt_stride =3D PAGE_SIZE;
+	u32 num_pages =3D DIV_ROUND_UP(audio_size, QUANTUM_FPGA_PAGE_SIZE);
+	u32 fw_pages_per_host_page =3D PAGE_SIZE / QUANTUM_FPGA_PAGE_SIZE;
+	u32 num_segments;
+	u32 seg, i;
+
+	if (!num_pages || PAGE_SIZE < QUANTUM_FPGA_PAGE_SIZE ||
+	    PAGE_SIZE % QUANTUM_FPGA_PAGE_SIZE)
+		return -EINVAL;
+	if (substream) {
+		if (!substream->runtime || !substream->runtime->dma_area ||
+		    substream->runtime->dma_bytes < audio_size)
+			return -EINVAL;
+	} else if (!stream->pages ||
+		   stream->num_pages * fw_pages_per_host_page < num_pages) {
+		return -EINVAL;
+	}
+	/* One word after the leaf entries is reserved for the next-record link. =
*/
+	if (!addr_per_segment || addr_per_segment >=3D QUANTUM_PT_WORDS)
+		return -EINVAL;
+
+	num_segments =3D (num_pages + addr_per_segment - 1) / addr_per_segment;
+
+	pt->num_entries =3D num_pages;
+	pt->num_segments =3D num_segments;
+	pt->addr_per_segment =3D addr_per_segment;
+	pt->size =3D num_segments * pt_stride;
+	pt->pages =3D kcalloc(num_segments, sizeof(*pt->pages), GFP_KERNEL);
+	if (!pt->pages)
+		return -ENOMEM;
+
+	for (seg =3D 0; seg < num_segments; seg++) {
+		pt->pages[seg].cpu_addr =3D dma_alloc_coherent(&chip->pci->dev,
+							     PAGE_SIZE,
+							     &pt->pages[seg].dma_handle,
+							     GFP_KERNEL);
+		if (!pt->pages[seg].cpu_addr)
+			goto err_free_pages;
+		memset(pt->pages[seg].cpu_addr, 0, PAGE_SIZE);
+	}
+	pt->cpu_addr =3D pt->pages[0].cpu_addr;
+	pt->dma_handle =3D pt->pages[0].dma_handle;
+
+	for (seg =3D 0; seg < num_segments; seg++) {
+		__le64 *entries =3D pt->pages[seg].cpu_addr;
+		u32 first_idx =3D seg * addr_per_segment;
+		u32 last_idx =3D min(first_idx + addr_per_segment, num_pages);
+		u32 count =3D last_idx - first_idx;
+
+		for (i =3D 0; i < count; i++) {
+			u32 fw_page =3D first_idx + i;
+			u32 host_page =3D fw_page / fw_pages_per_host_page;
+			u32 offset =3D (fw_page % fw_pages_per_host_page) *
+				     QUANTUM_FPGA_PAGE_SIZE;
+			u64 addr;
+
+			if (substream)
+				addr =3D snd_pcm_sgbuf_get_addr(substream,
+							      fw_page * QUANTUM_FPGA_PAGE_SIZE);
+			else
+				addr =3D stream->pages[host_page].dma_handle + offset;
+			if (!addr) {
+				seg =3D num_segments;
+				goto err_free_pages;
+			}
+			addr |=3D 1ULL;
+			entries[i] =3D cpu_to_le64(addr);
+		}
+
+		if (seg + 1 < num_segments) {
+			u64 chain =3D pt->pages[seg + 1].dma_handle | 1ULL;
+
+			entries[addr_per_segment] =3D cpu_to_le64(chain);
+		}
+	}
+
+	return 0;
+
+err_free_pages:
+	while (seg--)
+		dma_free_coherent(&chip->pci->dev, PAGE_SIZE,
+				  pt->pages[seg].cpu_addr,
+				  pt->pages[seg].dma_handle);
+	kfree(pt->pages);
+	memset(pt, 0, sizeof(*pt));
+	return -ENOMEM;
+}
+
+static int quantum_alloc_stream_pages(struct quantum_chip *chip,
+				      struct quantum_stream *stream,
+				      size_t bytes)
+{
+	u32 i;
+
+	if (!bytes)
+		return -EINVAL;
+
+	stream->num_pages =3D DIV_ROUND_UP(bytes, PAGE_SIZE);
+	stream->pages =3D kcalloc(stream->num_pages, sizeof(*stream->pages),
+				GFP_KERNEL);
+	if (!stream->pages)
+		return -ENOMEM;
+
+	for (i =3D 0; i < stream->num_pages; i++) {
+		stream->pages[i].cpu_addr =3D dma_alloc_coherent(&chip->pci->dev,
+							       PAGE_SIZE,
+							       &stream->pages[i].dma_handle,
+				GFP_KERNEL);
+		if (!stream->pages[i].cpu_addr)
+			goto err_free;
+		memset(stream->pages[i].cpu_addr, 0, PAGE_SIZE);
+	}
+
+	stream->buffer_bytes =3D bytes;
+	stream->valid =3D true;
+	stream->owns_pages =3D true;
+	return 0;
+
+err_free:
+	while (i--)
+		dma_free_coherent(&chip->pci->dev, PAGE_SIZE,
+				  stream->pages[i].cpu_addr,
+				  stream->pages[i].dma_handle);
+	kfree(stream->pages);
+	stream->pages =3D NULL;
+	stream->num_pages =3D 0;
+	stream->buffer_bytes =3D 0;
+	stream->valid =3D false;
+	stream->owns_pages =3D false;
+	return -ENOMEM;
+}
+
+static void quantum_free_stream_pages(struct quantum_chip *chip,
+				      struct quantum_stream *stream)
+{
+	u32 i;
+	bool gone =3D pci_dev_is_disconnected(chip->pci);
+
+	if (!stream->owns_pages)
+		goto reset;
+
+	/* Leak instead of touching a device already torn down by the PCI core. *=
/
+	if (!gone) {
+		for (i =3D 0; i < stream->num_pages; i++)
+			dma_free_coherent(&chip->pci->dev, PAGE_SIZE,
+					  stream->pages[i].cpu_addr,
+					  stream->pages[i].dma_handle);
+	}
+	kfree(stream->pages);
+
+reset:
+	stream->pages =3D NULL;
+	stream->num_pages =3D 0;
+	stream->buffer_bytes =3D 0;
+	stream->valid =3D false;
+	stream->owns_pages =3D false;
+}
+
+static void quantum_free_page_table(struct quantum_chip *chip,
+				    struct quantum_page_table *pt)
+{
+	u32 i;
+
+	/* See the comment in quantum_free_stream_pages() above. */
+	if (!pci_dev_is_disconnected(chip->pci)) {
+		for (i =3D 0; i < pt->num_segments; i++)
+			dma_free_coherent(&chip->pci->dev, PAGE_SIZE,
+					  pt->pages[i].cpu_addr,
+					  pt->pages[i].dma_handle);
+	}
+	kfree(pt->pages);
+	memset(pt, 0, sizeof(*pt));
+}
+
+static void quantum_reset_dma_descriptors(struct quantum_chip *chip)
+{
+	chip->playback.pt =3D &chip->playback.pt_storage;
+	chip->capture.pt =3D &chip->capture.pt_storage;
+	memset(&chip->playback.pt_storage, 0, sizeof(chip->playback.pt_storage));
+	memset(&chip->capture.pt_storage, 0, sizeof(chip->capture.pt_storage));
+}
+
+/* Publish a page table to hardware */
+
+static void quantum_write_page_table(struct quantum_chip *chip,
+				     struct quantum_page_table *pt,
+				     bool is_playback)
+{
+	u32 addr_low, addr_high;
+	u32 block_count, block_size;
+
+	addr_low =3D lower_32_bits(pt->dma_handle);
+	addr_high =3D upper_32_bits(pt->dma_handle);
+	block_count =3D chip->dma_ring_frames;
+	block_size =3D chip->dma_quantum_frames;
+	/* Ensure page-table contents are visible before publishing roots. */
+	dma_wmb();
+
+	if (is_playback) {
+		quantum_write32(chip, QUANTUM_REG_PLAY_BLOCK_COUNT, block_count);
+		quantum_write32(chip, QUANTUM_REG_PLAY_BLOCK_SIZE, block_size);
+		quantum_write32(chip, QUANTUM_REG_PLAY_PAGE_TABLE_ADDR_HIGH, addr_high);
+		quantum_write32(chip, QUANTUM_REG_PLAY_PAGE_TABLE_ADDR_LOW, addr_low);
+	} else {
+		quantum_write32(chip, QUANTUM_REG_REC_BLOCK_COUNT, block_count);
+		quantum_write32(chip, QUANTUM_REG_REC_BLOCK_SIZE, block_size);
+		quantum_write32(chip, QUANTUM_REG_REC_PAGE_TABLE_ADDR_HIGH, addr_high);
+		quantum_write32(chip, QUANTUM_REG_REC_PAGE_TABLE_ADDR_LOW, addr_low);
+	}
+}
+
+static void quantum_clear_page_table_registers(struct quantum_chip *chip)
+{
+	quantum_write32(chip, QUANTUM_REG_PLAY_BLOCK_COUNT, 0);
+	quantum_write32(chip, QUANTUM_REG_PLAY_BLOCK_SIZE, 0);
+	quantum_write32(chip, QUANTUM_REG_PLAY_PAGE_TABLE_ADDR_HIGH, 0);
+	quantum_write32(chip, QUANTUM_REG_PLAY_PAGE_TABLE_ADDR_LOW, 0);
+	quantum_write32(chip, QUANTUM_REG_REC_BLOCK_COUNT, 0);
+	quantum_write32(chip, QUANTUM_REG_REC_BLOCK_SIZE, 0);
+	quantum_write32(chip, QUANTUM_REG_REC_PAGE_TABLE_ADDR_HIGH, 0);
+	quantum_write32(chip, QUANTUM_REG_REC_PAGE_TABLE_ADDR_LOW, 0);
+
+	/* Flush posted register clears before freeing page-table storage. */
+	quantum_read32(chip, QUANTUM_REG_REC_PAGE_TABLE_ADDR_LOW);
+}
+
+/* Wait for the hardware to fetch the page tables */
+
+static int quantum_wait_page_table_ready(struct quantum_chip *chip)
+{
+	int timeout =3D 100;
+	u32 status;
+
+	while (timeout-- > 0) {
+		status =3D quantum_read32(chip, QUANTUM_REG_PAGE_TABLE_STATUS);
+		if ((status & 0xFF00) && (status & 0xFF))
+			return 0;
+
+		usleep_range(10, 20);
+	}
+
+	dev_err(&chip->pci->dev,
+		"page table activation timed out (status=3D0x%08x)\n", status);
+	return -ETIMEDOUT;
+}
+
+/* Allocate audio DMA resources */
+
+int quantum_allocate_dma_resources(struct quantum_chip *chip,
+				   unsigned int sample_rate,
+				   unsigned int period_frames,
+				   unsigned int buffer_frames,
+				   struct snd_pcm_substream *playback_substream,
+				   struct snd_pcm_substream *capture_substream)
+{
+	u32 channel_cfg;
+	u32 playback_channels, capture_channels;
+	size_t playback_bytes, capture_bytes;
+	u32 hw_quantum;
+	u32 addr_per_seg;
+	int err;
+
+	if (READ_ONCE(chip->resources_released) ||
+	    quantum_device_unavailable(chip))
+		return -ENODEV;
+
+	chip->playback.pt =3D &chip->playback.pt_storage;
+	chip->capture.pt =3D &chip->capture.pt_storage;
+
+	if (READ_ONCE(chip->dma_resources_allocated))
+		quantum_free_dma_resources(chip);
+
+	channel_cfg =3D quantum_read32(chip, QUANTUM_REG_CHANNEL_COUNTS);
+	capture_channels =3D channel_cfg & 0xff;
+	playback_channels =3D (channel_cfg >> 8) & 0xff;
+	if (!capture_channels || !playback_channels) {
+		dev_err(&chip->pci->dev,
+			"Invalid DMA channel register: 0x%08x\n", channel_cfg);
+		return -EIO;
+	}
+	hw_quantum =3D quantum_hw_quantum(sample_rate, period_frames);
+	if (!period_frames || !hw_quantum ||
+	    buffer_frames < hw_quantum ||
+	    buffer_frames % hw_quantum)
+		return -EINVAL;
+	chip->dma_quantum_frames =3D hw_quantum;
+	chip->dma_ring_frames =3D buffer_frames;
+	playback_bytes =3D (size_t)chip->dma_ring_frames * sizeof(u32) *
+			 playback_channels;
+	capture_bytes =3D (size_t)chip->dma_ring_frames * sizeof(u32) *
+			capture_channels;
+	chip->playback.channels =3D playback_channels;
+	chip->capture.channels =3D capture_channels;
+
+	chip->current_sample_rate =3D sample_rate;
+
+	chip->playback.buffer_bytes =3D playback_bytes;
+	chip->playback.valid =3D true;
+	chip->playback.owns_pages =3D false;
+	if (!playback_substream) {
+		err =3D quantum_alloc_stream_pages(chip, &chip->playback,
+						 playback_bytes);
+		if (err)
+			return err;
+	}
+
+	chip->capture.buffer_bytes =3D capture_bytes;
+	chip->capture.valid =3D true;
+	chip->capture.owns_pages =3D false;
+	if (!capture_substream) {
+		err =3D quantum_alloc_stream_pages(chip, &chip->capture,
+						 capture_bytes);
+		if (err)
+			goto err_free;
+	}
+
+	addr_per_seg =3D chip->addr_per_segment_play;
+	if (!addr_per_seg || addr_per_seg >=3D QUANTUM_PT_WORDS) {
+		err =3D -EINVAL;
+		dev_err(&chip->pci->dev, "Invalid playback PT leaf count: %u\n",
+			addr_per_seg);
+		goto err_free;
+	}
+
+	err =3D quantum_build_page_table(chip, &chip->playback.pt_storage,
+				       &chip->playback,
+				       playback_substream,
+				       playback_bytes, addr_per_seg);
+	if (err) {
+		dev_err(&chip->pci->dev, "Playback page table build failed: %d\n", err);
+		goto err_free;
+	}
+
+	addr_per_seg =3D chip->addr_per_segment_rec;
+	err =3D quantum_build_page_table(chip, &chip->capture.pt_storage,
+				       &chip->capture,
+				       capture_substream,
+				       capture_bytes, addr_per_seg);
+	if (err) {
+		dev_err(&chip->pci->dev, "Capture page table build failed: %d\n", err);
+		goto err_free_playback_pt;
+	}
+
+	chip->playback.pt =3D &chip->playback.pt_storage;
+	chip->capture.pt =3D &chip->capture.pt_storage;
+
+	quantum_write_page_table(chip, chip->playback.pt, true);
+	quantum_write_page_table(chip, chip->capture.pt, false);
+
+	err =3D quantum_wait_page_table_ready(chip);
+	if (err) {
+		quantum_clear_page_table_registers(chip);
+		goto err_free_capture_pt;
+	}
+	WRITE_ONCE(chip->dma_resources_allocated, true);
+	chip->period_frames =3D period_frames;
+	chip->buffer_frames =3D buffer_frames;
+
+	dev_dbg(&chip->pci->dev,
+		"DMA configured: rate=3D%u ring=3D%u quantum=3D%u play_ch=3D%u cap_ch=3D=
%u play_pt=3D%u/%u cap_pt=3D%u/%u\n",
+		sample_rate, chip->dma_ring_frames, chip->dma_quantum_frames,
+		playback_channels, capture_channels,
+		chip->playback.pt_storage.num_entries,
+		chip->playback.pt_storage.num_segments,
+		chip->capture.pt_storage.num_entries,
+		chip->capture.pt_storage.num_segments);
+	return 0;
+
+err_free_capture_pt:
+	if (chip->capture.pt_storage.cpu_addr)
+		quantum_free_page_table(chip, &chip->capture.pt_storage);
+err_free_playback_pt:
+	if (chip->playback.pt_storage.cpu_addr)
+		quantum_free_page_table(chip, &chip->playback.pt_storage);
+err_free:
+	quantum_reset_dma_descriptors(chip);
+	quantum_free_stream_pages(chip, &chip->capture);
+	quantum_free_stream_pages(chip, &chip->playback);
+	return err;
+}
+
+/* Free audio DMA resources */
+
+void quantum_free_dma_resources(struct quantum_chip *chip)
+{
+	if (!READ_ONCE(chip->dma_resources_allocated))
+		return;
+
+	/*
+	 * Normal hw_free stops the engine and invalidates its page-table roots.
+	 * Orderly PCI removal does that explicitly before setting device_gone;
+	 * surprise removal cannot access BARs, so this becomes memory-only clean=
up.
+	 */
+	if (!test_bit(0, &chip->device_gone)) {
+		quantum_stop_dma(chip);
+		quantum_clear_page_table_registers(chip);
+	} else {
+		WRITE_ONCE(chip->stream_active, false);
+	}
+
+	if (chip->playback.pt && chip->playback.pt->cpu_addr)
+		quantum_free_page_table(chip, chip->playback.pt);
+
+	if (chip->capture.pt && chip->capture.pt->cpu_addr)
+		quantum_free_page_table(chip, chip->capture.pt);
+
+	quantum_reset_dma_descriptors(chip);
+	quantum_free_stream_pages(chip, &chip->playback);
+	quantum_free_stream_pages(chip, &chip->capture);
+	quantum_cpu_latency_qos_disable(chip);
+
+	chip->playback.valid =3D false;
+	chip->capture.valid =3D false;
+	WRITE_ONCE(chip->dma_resources_allocated, false);
+	chip->current_sample_rate =3D 0;
+	dev_dbg(&chip->pci->dev, "audio DMA resources released\n");
+}
+
+/* Start audio DMA */
+
+int quantum_start_dma(struct quantum_chip *chip)
+{
+	if (test_bit(0, &chip->device_gone))
+		return -ENODEV;
+
+	if (!READ_ONCE(chip->dma_resources_allocated)) {
+		dev_err(&chip->pci->dev, "cannot start without DMA resources\n");
+		return -EINVAL;
+	}
+
+	/*
+	 * DMA_START=3D3 resets the hardware stream position to ring position
+	 * zero and cycle zero. Do not seed last_dma_pos from the stale value
+	 * left in DMA_POSITION while the engine is stopped.
+	 */
+	chip->last_dma_pos =3D 0;
+	chip->dma_cycle_count =3D 0;
+	WRITE_ONCE(chip->dma_position_valid, true);
+	chip->dma_elapsed_frames =3D 0;
+	chip->dma_pending_frames =3D 0;
+	chip->playback_attach_pending =3D false;
+	chip->capture_attach_pending =3D false;
+	quantum_cpu_latency_qos_enable(chip);
+
+	quantum_write32(chip, QUANTUM_REG_INTERRUPT_STATUS,
+			QUANTUM_INT_DMA);
+
+	quantum_write32_mask(chip, QUANTUM_REG_DMA_INT_ENABLE,
+			     QUANTUM_INT_DMA | QUANTUM_INT_CMD_RX,
+			     QUANTUM_INT_DMA | QUANTUM_INT_CMD_RX);
+
+	/*
+	 * Set stream_active before starting the engine so an immediate
+	 * interrupt cannot be discarded by the worker.
+	 */
+	/* Pair with IRQ/thread readers before they consume stream state. */
+	smp_store_release(&chip->stream_active, true);
+
+	quantum_write32(chip, QUANTUM_REG_DMA_START, 3);
+	dev_dbg(&chip->pci->dev,
+		"audio DMA started: rate=3D%u ring=3D%u quantum=3D%u\n",
+		chip->current_sample_rate, chip->dma_ring_frames,
+		chip->dma_quantum_frames);
+	return 0;
+}
+
+/* Stop audio DMA */
+
+static void __quantum_stop_dma(struct quantum_chip *chip, bool force)
+{
+	u32 irq_enable;
+	u32 status =3D 0;
+	int retry;
+
+	if (quantum_device_unavailable(chip) ||
+	    READ_ONCE(chip->resources_released)) {
+		WRITE_ONCE(chip->stream_active, false);
+		quantum_cpu_latency_qos_disable(chip);
+		return;
+	}
+
+	if (!force && !READ_ONCE(chip->stream_active)) {
+		quantum_cpu_latency_qos_disable(chip);
+		return;
+	}
+
+	irq_enable =3D quantum_read32(chip, QUANTUM_REG_DMA_INT_ENABLE);
+	quantum_write32(chip, QUANTUM_REG_DMA_INT_ENABLE,
+			irq_enable & ~QUANTUM_INT_DMA);
+	quantum_write32(chip, QUANTUM_REG_DMA_START, 0);
+	for (retry =3D 0; retry < 100; retry++) {
+		status =3D quantum_read32(chip, QUANTUM_REG_DMA_STOP_STATUS);
+		if (!(status & 3))
+			break;
+
+		usleep_range(10, 20);
+	}
+	if (retry =3D=3D 100)
+		dev_warn(&chip->pci->dev,
+			 "audio DMA did not become idle (status=3D0x%08x)\n",
+			 status);
+
+	WRITE_ONCE(chip->stream_active, false);
+	quantum_cpu_latency_qos_disable(chip);
+	dev_dbg(&chip->pci->dev, "audio DMA stopped\n");
+}
+
+void quantum_stop_dma(struct quantum_chip *chip)
+{
+	__quantum_stop_dma(chip, false);
+}
+
+void quantum_shutdown_audio_dma(struct quantum_chip *chip)
+{
+	if (quantum_device_unavailable(chip))
+		return;
+
+	__quantum_stop_dma(chip, true);
+	quantum_clear_page_table_registers(chip);
+	dev_dbg(&chip->pci->dev, "audio DMA registers cleared\n");
+}
+
+/* Update the audio DMA position */
+
+void quantum_update_dma_position(struct quantum_chip *chip)
+{
+	u32 raw, pos, cycle, cycle_delta, delta, max_delta;
+	s64 signed_delta;
+
+	/* Pair with stream_active publication before reading stream state. */
+	if (!smp_load_acquire(&chip->stream_active) ||
+	    !READ_ONCE(chip->dma_resources_allocated))
+		return;
+
+	raw =3D quantum_read32(chip, QUANTUM_REG_DMA_POSITION);
+	pos =3D raw & 0x000fffff;
+	cycle =3D raw >> 20;
+	if (!chip->dma_ring_frames || pos >=3D chip->dma_ring_frames) {
+		dev_warn_ratelimited(&chip->pci->dev,
+				     "invalid DMA position: raw=3D0x%08x ring=3D%u\n",
+			raw, chip->dma_ring_frames);
+		chip->dma_elapsed_frames =3D 0;
+		return;
+	}
+	if (!READ_ONCE(chip->dma_position_valid)) {
+		chip->last_dma_pos =3D pos;
+		chip->dma_cycle_count =3D cycle;
+		chip->dma_elapsed_frames =3D 0;
+		WRITE_ONCE(chip->dma_position_valid, true);
+		return;
+	}
+	cycle_delta =3D (cycle - chip->dma_cycle_count) & 0xfff;
+	signed_delta =3D (s64)pos - chip->last_dma_pos +
+		       (s64)cycle_delta * chip->dma_ring_frames;
+	if (signed_delta < 0) {
+		dev_warn_ratelimited(&chip->pci->dev,
+				     "DMA position moved backwards: raw=3D0x%08x last=3D%u cycle_delta=
=3D%u\n",
+			raw, chip->last_dma_pos, cycle_delta);
+		delta =3D chip->dma_quantum_frames;
+	} else {
+		delta =3D signed_delta;
+	}
+	max_delta =3D chip->dma_ring_frames;
+	if (delta > max_delta) {
+		dev_warn_ratelimited(&chip->pci->dev,
+				     "implausible DMA delta: raw=3D0x%08x delta=3D%u; resyncing\n",
+			raw, delta);
+		delta =3D chip->dma_quantum_frames;
+	}
+	chip->last_dma_pos =3D pos;
+	chip->dma_cycle_count =3D cycle;
+	chip->dma_elapsed_frames =3D delta;
+}
+
+void quantum_transfer_audio(struct quantum_chip *chip)
+{
+	u32 raw_elapsed =3D chip->dma_elapsed_frames;
+	u32 quantum =3D chip->dma_quantum_frames;
+	u32 processed;
+
+	if (!raw_elapsed || !quantum)
+		return;
+
+	chip->dma_pending_frames +=3D raw_elapsed;
+	processed =3D (chip->dma_pending_frames / quantum) * quantum;
+	chip->dma_pending_frames -=3D processed;
+	if (READ_ONCE(chip->capture_substream))
+		/* Ensure captured frames are visible before ALSA wakeups. */
+		dma_rmb();
+
+	chip->dma_elapsed_frames =3D processed;
+}
diff --git a/sound/pci/quantum/quantum_main.c b/sound/pci/quantum/quantum_m=
ain.c
new file mode 100644
index 000000000..16c81cc16
--- /dev/null
+++ b/sound/pci/quantum/quantum_main.c
@@ -0,0 +1,1148 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright (C) 2026 Nicholas Johnson */
+#include <linux/module.h>
+
+#include "quantum.h"
+
+#define DRV_NAME "snd-quantum"
+
+/* Module parameters */
+
+static int index[SNDRV_CARDS] =3D SNDRV_DEFAULT_IDX;
+static char *id[SNDRV_CARDS] =3D SNDRV_DEFAULT_STR;
+static bool enable[SNDRV_CARDS] =3D SNDRV_DEFAULT_ENABLE_PNP;
+
+module_param_array(index, int, NULL, 0444);
+MODULE_PARM_DESC(index, "ALSA card index");
+module_param_array(id, charp, NULL, 0444);
+MODULE_PARM_DESC(id, "ALSA card ID");
+module_param_array(enable, bool, NULL, 0444);
+MODULE_PARM_DESC(enable, "Enable the sound card");
+
+/*
+ * Slot bookkeeping for index[]/id[]/enable[]. This Thunderbolt device can=
 be
+ * un/re-enumerated many times per boot; a monotonically increasing counte=
r
+ * would exhaust SNDRV_CARDS, so track occupancy instead.
+ */
+static DEFINE_MUTEX(quantum_slot_lock);
+static bool quantum_slot_used[SNDRV_CARDS];
+
+static int quantum_acquire_card_slot(void)
+{
+	int slot;
+
+	mutex_lock(&quantum_slot_lock);
+	for (slot =3D 0; slot < SNDRV_CARDS; slot++) {
+		if (!quantum_slot_used[slot]) {
+			quantum_slot_used[slot] =3D true;
+			mutex_unlock(&quantum_slot_lock);
+			return slot;
+		}
+	}
+	mutex_unlock(&quantum_slot_lock);
+	return -ENODEV;
+}
+
+static void quantum_release_card_slot(int slot)
+{
+	if (slot < 0 || slot >=3D SNDRV_CARDS)
+		return;
+
+	mutex_lock(&quantum_slot_lock);
+	quantum_slot_used[slot] =3D false;
+	mutex_unlock(&quantum_slot_lock);
+}
+
+static void quantum_enable_cmd_interrupt(struct quantum_chip *chip);
+static void quantum_disable_interrupts(struct quantum_chip *chip);
+
+struct quantum_device_entry {
+	const char *card_id;
+	const char *name;
+};
+
+static const struct quantum_device_entry quantum_2626_model =3D {
+	.card_id =3D "Quantum2626",
+	.name =3D "PreSonus Quantum 2626",
+};
+
+static const struct pci_device_id quantum_ids[] =3D {
+	{ PCI_DEVICE(0x1c67, 0x0104),
+	  .driver_data =3D (kernel_ulong_t)&quantum_2626_model },
+	{ }
+};
+MODULE_DEVICE_TABLE(pci, quantum_ids);
+
+/* Device init */
+
+static void quantum_device_init(struct quantum_chip *chip)
+{
+	u32 fpga_bl_ver, fpga_image_ver, fpga_ifc_ver;
+	u32 mcu_bl_ver, mcu_main_ver;
+	u32 dfu_payload_size;
+
+	if (test_bit(0, &chip->device_gone))
+		return;
+
+	fpga_bl_ver =3D quantum_read32(chip, QUANTUM_REG_FPGA_BL_VER);
+	fpga_image_ver =3D quantum_read32(chip, QUANTUM_REG_FPGA_IMAGE_VER);
+	fpga_ifc_ver =3D quantum_read32(chip, QUANTUM_REG_FPGA_IFC_VER);
+	mcu_bl_ver =3D quantum_read32(chip, QUANTUM_REG_MCU_BL_VER);
+	mcu_main_ver =3D quantum_read32(chip, QUANTUM_REG_MCU_MAIN_VER);
+
+	dev_dbg(&chip->pci->dev,
+		"FPGA: BL=3D0x%08x IMG=3D0x%08x IFC=3D0x%08x\n",
+		fpga_bl_ver, fpga_image_ver, fpga_ifc_ver);
+	dev_dbg(&chip->pci->dev,
+		"MCU: BL=3D0x%08x MAIN=3D0x%08x\n",
+		mcu_bl_ver, mcu_main_ver);
+
+	chip->addr_per_segment_rec =3D quantum_read32(chip, QUANTUM_REG_ADDR_PER_=
SEGMENT);
+	chip->addr_per_segment_play =3D quantum_read32(chip, QUANTUM_REG_ADDR_PER=
_SEGMENT2);
+
+	if (chip->addr_per_segment_rec =3D=3D 0 || chip->addr_per_segment_rec >=
=3D 512)
+		chip->addr_per_segment_rec =3D 15;
+	if (chip->addr_per_segment_play =3D=3D 0 || chip->addr_per_segment_play >=
=3D 512)
+		chip->addr_per_segment_play =3D 15;
+
+	dev_dbg(&chip->pci->dev,
+		"ADDR_PER_SEGMENT: REC=3D%u PLAY=3D%u\n",
+		chip->addr_per_segment_rec, chip->addr_per_segment_play);
+
+	dfu_payload_size =3D quantum_read32(chip, QUANTUM_REG_DFU_PAYLOAD_SIZE);
+	dev_dbg(&chip->pci->dev, "DFU payload size: 0x%08x\n",
+		dfu_payload_size);
+
+	chip->sample_rate =3D 48000;
+	chip->clock_source =3D CLK_SOURCE_INTERNAL;
+	chip->powered_on =3D true;
+}
+
+/* Command buffers */
+
+static int quantum_init_command_buffers(struct quantum_chip *chip)
+{
+	u32 cfg;
+	int i;
+	size_t total_size;
+
+	if (test_bit(0, &chip->device_gone))
+		return -ENODEV;
+
+	cfg =3D quantum_read32(chip, QUANTUM_REG_CMD_MSG_CONFIG);
+	chip->cmd_msg_count =3D cfg & 0xFF;
+	chip->cmd_msg_size =3D 4096;
+
+	dev_dbg(&chip->pci->dev,
+		"CMD_MSG_CONFIG: %u slots x %u bytes\n",
+		chip->cmd_msg_count, chip->cmd_msg_size);
+
+	if (chip->cmd_msg_count =3D=3D 0 || chip->cmd_msg_count > 8)
+		chip->cmd_msg_count =3D 8;
+
+	total_size =3D chip->cmd_msg_count * chip->cmd_msg_size;
+
+	chip->cmd_tx_cpu =3D dma_alloc_coherent(&chip->pci->dev, total_size,
+					      &chip->cmd_tx_dma_base,
+					      GFP_KERNEL);
+	if (!chip->cmd_tx_cpu)
+		return -ENOMEM;
+	memset(chip->cmd_tx_cpu, 0, total_size);
+
+	chip->cmd_rx_cpu =3D dma_alloc_coherent(&chip->pci->dev, total_size,
+					      &chip->cmd_rx_dma_base,
+					      GFP_KERNEL);
+	if (!chip->cmd_rx_cpu) {
+		dma_free_coherent(&chip->pci->dev, total_size,
+				  chip->cmd_tx_cpu, chip->cmd_tx_dma_base);
+		return -ENOMEM;
+	}
+	memset(chip->cmd_rx_cpu, 0, total_size);
+
+	for (i =3D 0; i < chip->cmd_msg_count; i++) {
+		chip->cmd_tx_slots[i] =3D chip->cmd_tx_cpu + i * chip->cmd_msg_size;
+		chip->cmd_tx_dma[i] =3D chip->cmd_tx_dma_base + i * chip->cmd_msg_size;
+		chip->cmd_rx_slots[i] =3D chip->cmd_rx_cpu + i * chip->cmd_msg_size;
+		chip->cmd_rx_dma[i] =3D chip->cmd_rx_dma_base + i * chip->cmd_msg_size;
+	}
+
+	dev_dbg(&chip->pci->dev,
+		"command buffers: TX=3D%pad RX=3D%pad (%zu bytes total)\n",
+		 &chip->cmd_tx_dma_base, &chip->cmd_rx_dma_base,
+		 total_size * 2);
+
+	chip->dma_prepared =3D true;
+	return 0;
+}
+
+static void quantum_prepare_dma(struct quantum_chip *chip)
+{
+	int i;
+
+	if (!chip->dma_prepared)
+		return;
+
+	/* Do not expose command interrupts until the IRQ handler is installed. *=
/
+	quantum_write32_mask(chip, QUANTUM_REG_DMA_INT_ENABLE,
+			     QUANTUM_INT_DMA | QUANTUM_INT_CMD_RX, 0);
+	quantum_write32(chip, QUANTUM_REG_INTERRUPT_STATUS,
+			QUANTUM_INT_DMA | QUANTUM_INT_CMD_RX);
+
+	for (i =3D 0; i < chip->cmd_msg_count; i++) {
+		quantum_write32(chip, QUANTUM_REG_CMD_TX_ADDR_BASE + i * 8,
+				lower_32_bits(chip->cmd_tx_dma[i]));
+		quantum_write32(chip, QUANTUM_REG_CMD_TX_ADDR_BASE + i * 8 + 4,
+				upper_32_bits(chip->cmd_tx_dma[i]));
+	}
+
+	for (i =3D 0; i < chip->cmd_msg_count; i++) {
+		quantum_write32(chip, QUANTUM_REG_CMD_RX_ADDR_BASE + i * 8,
+				lower_32_bits(chip->cmd_rx_dma[i]));
+		quantum_write32(chip, QUANTUM_REG_CMD_RX_ADDR_BASE + i * 8 + 4,
+				upper_32_bits(chip->cmd_rx_dma[i]));
+	}
+
+	for (i =3D 0; i < chip->cmd_msg_count; i++)
+		quantum_write32(chip, QUANTUM_REG_CMD_TX_LEN_BASE + i * 4, 0);
+
+	quantum_write32(chip, QUANTUM_REG_TX_SW_POS, 0);
+	quantum_write32(chip, QUANTUM_REG_RX_SW_POS, 0);
+}
+
+/* Enable command DMA */
+
+static int quantum_enable_dma_engine(struct quantum_chip *chip)
+{
+	u32 status;
+	int retry;
+
+	if (!chip->dma_prepared)
+		return -EINVAL;
+
+	if (!chip->iobase)
+		return -ENODEV;
+
+	quantum_write32(chip, QUANTUM_REG_TX_SW_POS, 0);
+	quantum_write32(chip, QUANTUM_REG_RX_SW_POS, 0);
+
+	status =3D quantum_read32(chip, QUANTUM_REG_INTERRUPT_STATUS);
+	if (status)
+		quantum_write32(chip, QUANTUM_REG_INTERRUPT_STATUS, status);
+
+	quantum_write32(chip, QUANTUM_REG_DMA_CONTROL, 0x101);
+
+	for (retry =3D 0; retry < 100; retry++) {
+		status =3D quantum_read32(chip, QUANTUM_REG_DMA_STATUS);
+		if ((status & 0x10001) =3D=3D 0x10001)
+			break;
+
+		usleep_range(100, 200);
+	}
+
+	if (retry >=3D 100) {
+		dev_err(&chip->pci->dev,
+			"command DMA did not start (status=3D0x%08x)\n", status);
+		return -ETIMEDOUT;
+	}
+
+	dev_dbg(&chip->pci->dev, "command DMA started\n");
+	return 0;
+}
+
+/* Disable command DMA */
+
+static void quantum_clear_command_dma_registers(struct quantum_chip *chip)
+{
+	int i;
+
+	for (i =3D 0; i < chip->cmd_msg_count; i++) {
+		quantum_write32(chip, QUANTUM_REG_CMD_TX_ADDR_BASE + i * 8, 0);
+		quantum_write32(chip,
+				QUANTUM_REG_CMD_TX_ADDR_BASE + i * 8 + 4, 0);
+		quantum_write32(chip, QUANTUM_REG_CMD_RX_ADDR_BASE + i * 8, 0);
+		quantum_write32(chip,
+				QUANTUM_REG_CMD_RX_ADDR_BASE + i * 8 + 4, 0);
+		quantum_write32(chip, QUANTUM_REG_CMD_TX_LEN_BASE + i * 4, 0);
+	}
+
+	quantum_write32(chip, QUANTUM_REG_TX_SW_POS, 0);
+	quantum_write32(chip, QUANTUM_REG_RX_SW_POS, 0);
+
+	/* Flush posted command-ring register clears before freeing slots. */
+	quantum_read32(chip, QUANTUM_REG_RX_SW_POS);
+}
+
+static void quantum_disable_dma_engine(struct quantum_chip *chip)
+{
+	u32 status =3D 0;
+	int retry;
+
+	if (!chip->dma_prepared || quantum_device_unavailable(chip))
+		return;
+
+	quantum_disable_interrupts(chip);
+	quantum_write32(chip, QUANTUM_REG_DMA_CONTROL, 0);
+
+	for (retry =3D 0; retry < 100; retry++) {
+		status =3D quantum_read32(chip, QUANTUM_REG_DMA_STATUS);
+		if ((status & 0x10001) =3D=3D 0)
+			break;
+
+		usleep_range(100, 200);
+	}
+
+	if (retry =3D=3D 100) {
+		dev_warn(&chip->pci->dev,
+			 "command DMA did not become idle (status=3D0x%08x)\n",
+			 status);
+	} else {
+		quantum_clear_command_dma_registers(chip);
+	}
+
+	status =3D quantum_read32(chip, QUANTUM_REG_INTERRUPT_STATUS);
+	if (status && status !=3D U32_MAX)
+		quantum_write32(chip, QUANTUM_REG_INTERRUPT_STATUS, status);
+
+	dev_dbg(&chip->pci->dev, "command DMA stopped\n");
+}
+
+/* Complete command-interface initialization */
+
+static int quantum_complete_init(struct quantum_chip *chip)
+{
+	int retry;
+	int err;
+
+	if (test_bit(0, &chip->device_gone))
+		return -ENODEV;
+
+	if (!chip->iobase) {
+		dev_err(&chip->pci->dev, "cannot complete initialization without BAR map=
ping\n");
+		return -EIO;
+	}
+
+	quantum_prepare_dma(chip);
+	err =3D quantum_enable_dma_engine(chip);
+	if (err)
+		return err;
+
+	for (retry =3D 0; retry < 100; retry++) {
+		u32 tx =3D quantum_read32(chip, QUANTUM_REG_TX_SLOT_STATUS);
+		u32 rx =3D quantum_read32(chip, QUANTUM_REG_RX_SLOT_STATUS);
+
+		if (tx =3D=3D 0 && rx =3D=3D 0) {
+			chip->tci_initialized =3D true;
+			dev_dbg(&chip->pci->dev, "command interface initialized\n");
+			return 0;
+		}
+			usleep_range(100, 200);
+	}
+
+	dev_err(&chip->pci->dev, "command ring did not become idle\n");
+	return -ETIMEDOUT;
+}
+
+/* Interrupt control */
+
+static void quantum_enable_cmd_interrupt(struct quantum_chip *chip)
+{
+	u32 val;
+
+	if (quantum_device_unavailable(chip))
+		return;
+
+	quantum_write32(chip, QUANTUM_REG_INTERRUPT_STATUS, 0x80000000);
+
+	val =3D quantum_read32(chip, QUANTUM_REG_DMA_INT_ENABLE);
+	val |=3D QUANTUM_INT_CMD_RX;
+	quantum_write32(chip, QUANTUM_REG_DMA_INT_ENABLE, val);
+}
+
+static void quantum_disable_interrupts(struct quantum_chip *chip)
+{
+	u32 val;
+
+	if (quantum_device_unavailable(chip))
+		return;
+
+	val =3D quantum_read32(chip, QUANTUM_REG_DMA_INT_ENABLE);
+	val &=3D ~(QUANTUM_INT_DMA | QUANTUM_INT_CMD_RX);
+	quantum_write32(chip, QUANTUM_REG_DMA_INT_ENABLE, val);
+}
+
+/*
+ * dma_mutex guards this function's read/modify/write of last_dma_pos,
+ * dma_cycle_count, dma_elapsed_frames, dma_pending_frames, and the
+ * per-direction period accumulators/attach-pending flags -- the same
+ * fields quantum_pcm_trigger() touches under dma_mutex on the control-pla=
ne
+ * side, and which were previously unsynchronized against this IRQ thread.
+ *
+ * The lock is held ONLY around that bookkeeping and is always released
+ * before calling snd_pcm_period_elapsed(): ALSA's own XRUN handling can
+ * call back into this driver's .trigger() synchronously from inside
+ * snd_pcm_period_elapsed() (on this same thread), and quantum_pcm_trigger=
()
+ * also takes dma_mutex -- holding it across that call self-deadlocks the
+ * IRQ thread. Never widen the locked region to include the
+ * snd_pcm_period_elapsed() calls below.
+ */
+static void quantum_process_audio(struct quantum_chip *chip)
+{
+	struct snd_pcm_substream *playback;
+	struct snd_pcm_substream *capture;
+	u32 elapsed;
+	u32 period_size;
+	u32 playback_periods_to_fire =3D 0;
+	u32 capture_periods_to_fire =3D 0;
+
+	if (quantum_device_gone(chip))
+		return;
+
+	/* Pair with stream_active publication before reading stream state. */
+	if (!smp_load_acquire(&chip->stream_active) ||
+	    !READ_ONCE(chip->dma_resources_allocated))
+		return;
+
+	mutex_lock(&chip->dma_mutex);
+
+	quantum_update_dma_position(chip);
+	if (chip->dma_elapsed_frames >=3D 2 * chip->dma_quantum_frames)
+		dev_dbg_ratelimited(&chip->pci->dev,
+				    "late audio service: elapsed=3D%u quantum=3D%u\n",
+			chip->dma_elapsed_frames, chip->dma_quantum_frames);
+
+	quantum_transfer_audio(chip);
+	elapsed =3D chip->dma_elapsed_frames;
+	if (!elapsed) {
+		mutex_unlock(&chip->dma_mutex);
+		return;
+	}
+
+	playback =3D READ_ONCE(chip->playback_substream);
+	if (playback && playback->runtime) {
+		period_size =3D playback->runtime->period_size;
+		if (period_size) {
+			if (chip->playback_attach_pending) {
+				/*
+				 * Playback restarted while capture kept the shared DMA
+				 * engine running.  Wait until the hardware ring returns
+				 * to frame zero so ALSA and the device agree on the
+				 * restarted stream's initial position.
+				 */
+				chip->playback_period_accum =3D 0;
+				if (!chip->last_dma_pos)
+					chip->playback_attach_pending =3D false;
+			} else {
+				chip->playback_period_accum +=3D elapsed;
+				playback_periods_to_fire =3D
+					chip->playback_period_accum / period_size;
+				chip->playback_period_accum %=3D period_size;
+			}
+		}
+	}
+
+	capture =3D READ_ONCE(chip->capture_substream);
+	if (capture && capture->runtime) {
+		period_size =3D capture->runtime->period_size;
+		if (period_size) {
+			if (chip->capture_attach_pending) {
+				/* Same ring-zero attach logic as playback, above. */
+				chip->capture_period_accum =3D 0;
+				if (!chip->last_dma_pos)
+					chip->capture_attach_pending =3D false;
+			} else {
+				chip->capture_period_accum +=3D elapsed;
+				capture_periods_to_fire =3D
+					chip->capture_period_accum / period_size;
+				chip->capture_period_accum %=3D period_size;
+			}
+		}
+	}
+
+	mutex_unlock(&chip->dma_mutex);
+
+	while (playback_periods_to_fire--)
+		snd_pcm_period_elapsed(playback);
+	while (capture_periods_to_fire--)
+		snd_pcm_period_elapsed(capture);
+}
+
+static void quantum_cmd_work_handler(struct work_struct *work)
+{
+	struct quantum_chip *chip =3D container_of(work, struct quantum_chip,
+						 cmd_work);
+
+	if (quantum_device_gone(chip))
+		return;
+
+	dev_dbg_ratelimited(&chip->pci->dev, "processing command responses\n");
+	quantum_process_rx_messages(chip);
+}
+
+static irqreturn_t quantum_interrupt_handler(int irq, void *data)
+{
+	struct quantum_chip *chip =3D data;
+	u32 status;
+
+	if (quantum_device_unavailable(chip))
+		return IRQ_NONE;
+
+	status =3D quantum_read32(chip, QUANTUM_REG_INTERRUPT_STATUS);
+	if (!status || status =3D=3D U32_MAX)
+		return IRQ_NONE;
+
+	/* Clear the W1C status before waking the thread. */
+	quantum_write32(chip, QUANTUM_REG_INTERRUPT_STATUS, status);
+	atomic_or(status, &chip->pending_interrupts);
+
+	return IRQ_WAKE_THREAD;
+}
+
+static irqreturn_t quantum_interrupt_thread(int irq, void *data)
+{
+	struct quantum_chip *chip =3D data;
+	u32 status;
+	irqreturn_t ret =3D IRQ_NONE;
+
+	if (quantum_device_gone(chip))
+		return IRQ_NONE;
+
+	while ((status =3D atomic_xchg(&chip->pending_interrupts, 0))) {
+		if (quantum_device_gone(chip))
+			break;
+
+		if (status & QUANTUM_INT_DMA)
+			quantum_process_audio(chip);
+		if (status & QUANTUM_INT_CMD_RX)
+			queue_work(chip->cmd_wq, &chip->cmd_work);
+		ret =3D IRQ_HANDLED;
+	}
+
+	return ret;
+}
+
+/* Handle device power-state events */
+
+void quantum_power_state_changed(struct quantum_chip *chip, bool powered_o=
n)
+{
+	if (quantum_device_gone(chip) ||
+	    READ_ONCE(chip->resources_released))
+		return;
+
+	if (chip->powered_on =3D=3D powered_on)
+		return;
+
+	chip->powered_on =3D powered_on;
+
+	if (powered_on) {
+		int err;
+
+		dev_dbg(&chip->pci->dev, "power state changed: on\n");
+		quantum_prepare_dma(chip);
+		err =3D quantum_enable_dma_engine(chip);
+		if (err)
+			dev_err(&chip->pci->dev,
+				"failed to restart command DMA: %d\n", err);
+		else
+			quantum_enable_cmd_interrupt(chip);
+	} else {
+		dev_dbg(&chip->pci->dev, "power state changed: off\n");
+		quantum_disable_dma_engine(chip);
+		if (READ_ONCE(chip->stream_active))
+			quantum_stop_dma(chip);
+	}
+}
+
+/* Device creation */
+
+static int snd_quantum_create(struct snd_card *card, struct pci_dev *pci,
+			      const struct quantum_device_entry *model)
+{
+	struct quantum_chip *chip =3D card->private_data;
+	unsigned long irq_flags;
+	int err, nvec, ret;
+
+	chip->card =3D card;
+	chip->pci =3D pci;
+	chip->model_id =3D model->card_id;
+	chip->model_name =3D model->name;
+	chip->irq =3D -1;
+	atomic_set(&chip->pending_interrupts, 0);
+	chip->device_gone =3D 0;
+	WRITE_ONCE(chip->removing, false);
+	WRITE_ONCE(chip->dma_resources_allocated, false);
+	chip->playback.pt =3D &chip->playback.pt_storage;
+	chip->capture.pt =3D &chip->capture.pt_storage;
+
+	spin_lock_init(&chip->cmd_lock);
+	spin_lock_init(&chip->midi_lock);
+	mutex_init(&chip->dma_mutex);
+	mutex_init(&chip->tci_tx_mutex);
+	chip->async_quiesced =3D false;
+	INIT_LIST_HEAD(&chip->pending_cmds);
+
+	chip->tci_initialized =3D false;
+	chip->tci_ready =3D false;
+
+	chip->cmd_wq =3D alloc_workqueue("quantum-cmd",
+				       WQ_UNBOUND | WQ_MEM_RECLAIM,
+				       1);
+
+	if (!chip->cmd_wq) {
+		dev_err(&pci->dev, "failed to create command workqueue\n");
+		err =3D -ENOMEM;
+		goto err_wq;
+	}
+
+	INIT_WORK(&chip->cmd_work, quantum_cmd_work_handler);
+	INIT_WORK(&chip->midi_tx_work, quantum_midi_tx_work_handler);
+
+	err =3D pci_enable_device(pci);
+	if (err)
+		goto err_wq;
+
+	err =3D dma_set_mask_and_coherent(&pci->dev, DMA_BIT_MASK(32));
+	if (err) {
+		dev_err(&pci->dev, "failed to set 32-bit DMA mask: %d\n", err);
+		goto err_disable;
+	}
+	pci_set_master(pci);
+
+	err =3D pci_request_regions(pci, DRV_NAME);
+	if (err)
+		goto err_disable;
+
+	chip->iobase =3D pci_iomap(pci, 0, pci_resource_len(pci, 0));
+	if (!chip->iobase) {
+		err =3D -ENOMEM;
+		goto err_regions;
+	}
+	quantum_device_init(chip);
+	err =3D quantum_init_command_buffers(chip);
+	if (err) {
+		dev_err(&pci->dev, "command buffer initialization failed: %d\n", err);
+		goto err_iounmap;
+	}
+	err =3D quantum_complete_init(chip);
+	if (err) {
+		dev_err(&pci->dev, "hardware initialization failed: %d\n", err);
+		goto err_free_cmd;
+	}
+	nvec =3D pci_alloc_irq_vectors(pci, 1, 1, PCI_IRQ_MSI);
+	if (nvec > 0) {
+		chip->irq =3D pci_irq_vector(pci, 0);
+		chip->msi_allocated =3D true;
+		pci_intx(pci, 0);
+	} else {
+		chip->irq =3D pci->irq;
+		chip->msi_allocated =3D false;
+		pci_intx(pci, 1);
+		dev_warn(&pci->dev, "MSI unavailable, using legacy INTx\n");
+	}
+
+	if (chip->irq > 0) {
+		irq_flags =3D chip->msi_allocated ? 0 : IRQF_SHARED;
+		err =3D request_threaded_irq(chip->irq,
+					   quantum_interrupt_handler,
+					   quantum_interrupt_thread,
+					   irq_flags,
+					   DRV_NAME, chip);
+		if (!err) {
+			chip->irq_requested =3D true;
+			card->sync_irq =3D chip->irq;
+		} else {
+			dev_err(&pci->dev, "failed to request IRQ %d: %d\n",
+				chip->irq, err);
+			goto err_free_irq;
+		}
+	} else {
+		err =3D -ENODEV;
+		goto err_free_irq;
+	}
+
+	quantum_enable_cmd_interrupt(chip);
+	ret =3D quantum_get_serial_number(chip);
+	if (!ret) {
+		chip->tci_ready =3D true;
+		chip->tci_initialized =3D true;
+		err =3D snd_quantum_pcm_new(chip);
+		if (err) {
+			dev_err(&pci->dev, "PCM creation failed: %d\n", err);
+			goto err_free_irq;
+		}
+		err =3D quantum_midi_new(chip);
+		if (err) {
+			dev_err(&pci->dev, "MIDI creation failed: %d\n", err);
+			goto err_free_irq;
+		}
+
+		err =3D quantum_mixer_new(chip);
+		if (err) {
+			dev_err(&pci->dev, "Mixer creation failed: %d\n", err);
+			goto err_free_irq;
+		}
+	} else {
+		chip->tci_ready =3D false;
+		chip->tci_initialized =3D false;
+		chip->tci_fatal_error =3D true;
+		err =3D -EIO;
+		goto err_free_irq;
+	}
+
+	return 0;
+
+err_free_irq:
+	quantum_disable_dma_engine(chip);
+	if (chip->irq_requested) {
+		free_irq(chip->irq, chip);
+		chip->irq_requested =3D false;
+		card->sync_irq =3D -1;
+	}
+	cancel_work_sync(&chip->cmd_work);
+	cancel_work_sync(&chip->midi_tx_work);
+	if (chip->msi_allocated)
+		pci_free_irq_vectors(pci);
+	goto err_free_cmd_buffers;
+err_free_cmd:
+	quantum_disable_dma_engine(chip);
+err_free_cmd_buffers:
+	if (chip->cmd_tx_cpu) {
+		dma_free_coherent(&pci->dev,
+				  chip->cmd_msg_count * chip->cmd_msg_size,
+			chip->cmd_tx_cpu, chip->cmd_tx_dma_base);
+	}
+	if (chip->cmd_rx_cpu) {
+		dma_free_coherent(&pci->dev,
+				  chip->cmd_msg_count * chip->cmd_msg_size,
+			chip->cmd_rx_cpu, chip->cmd_rx_dma_base);
+	}
+err_iounmap:
+	pci_iounmap(pci, chip->iobase);
+err_regions:
+	pci_release_regions(pci);
+err_disable:
+	pci_disable_device(pci);
+err_wq:
+	if (chip->cmd_wq)
+		destroy_workqueue(chip->cmd_wq);
+	return err;
+}
+
+/* Device teardown */
+
+static void quantum_begin_remove(struct quantum_chip *chip)
+{
+	if (READ_ONCE(chip->removing))
+		return;
+
+	WRITE_ONCE(chip->removing, true);
+	/* Publish removal before any callback can enter the hardware paths. */
+	smp_mb();
+	WRITE_ONCE(chip->tci_ready, false);
+	WRITE_ONCE(chip->tci_initialized, false);
+}
+
+static void quantum_mark_gone(struct quantum_chip *chip)
+{
+	set_bit(0, &chip->device_gone);
+	/* Publish device_gone before clearing stream-visible pointers. */
+	smp_mb__after_atomic();
+
+	WRITE_ONCE(chip->stream_active, false);
+	WRITE_ONCE(chip->playback_substream, NULL);
+	WRITE_ONCE(chip->capture_substream, NULL);
+}
+
+/*
+ * Marks the device gone under dma_mutex, the lock hw_params()/hw_free() h=
old
+ * around their own DMA-API calls, so those calls always either finish fir=
st
+ * or see device_gone before starting.
+ */
+static void quantum_mark_gone_locked(struct quantum_chip *chip)
+{
+	mutex_lock(&chip->dma_mutex);
+	quantum_mark_gone(chip);
+	mutex_unlock(&chip->dma_mutex);
+}
+
+static void quantum_abort_pending_commands(struct quantum_chip *chip)
+{
+	struct quantum_tci_cmd *cmd;
+	unsigned long flags;
+
+	spin_lock_irqsave(&chip->cmd_lock, flags);
+	list_for_each_entry(cmd, &chip->pending_cmds, list) {
+		if (cmd->responded)
+			continue;
+
+		cmd->status =3D -ENODEV;
+		cmd->responded =3D true;
+		complete(&cmd->done);
+	}
+	spin_unlock_irqrestore(&chip->cmd_lock, flags);
+}
+
+static void snd_quantum_drain_tci(struct quantum_chip *chip)
+{
+	/* Drain a sender that passed its removal check before removing was set. =
*/
+	mutex_lock(&chip->tci_tx_mutex);
+	mutex_unlock(&chip->tci_tx_mutex);
+	quantum_abort_pending_commands(chip);
+}
+
+static void snd_quantum_stop_async(struct snd_card *card)
+{
+	struct quantum_chip *chip =3D card->private_data;
+	unsigned long flags;
+
+	if (!chip || READ_ONCE(chip->async_quiesced))
+		return;
+
+	if (chip->irq_requested) {
+		free_irq(chip->irq, chip);
+		chip->irq_requested =3D false;
+		card->sync_irq =3D -1;
+	}
+	atomic_set(&chip->pending_interrupts, 0);
+
+	cancel_work_sync(&chip->cmd_work);
+	cancel_work_sync(&chip->midi_tx_work);
+
+	spin_lock_irqsave(&chip->midi_lock, flags);
+	chip->midi_input_triggered =3D false;
+	chip->midi_output_triggered =3D false;
+	chip->midi_input =3D NULL;
+	chip->midi_output =3D NULL;
+	spin_unlock_irqrestore(&chip->midi_lock, flags);
+
+	WRITE_ONCE(chip->async_quiesced, true);
+}
+
+static void snd_quantum_shutdown_hardware(struct quantum_chip *chip)
+{
+	if (quantum_device_unavailable(chip))
+		return;
+
+	dev_dbg(&chip->pci->dev, "stopping hardware DMA engines\n");
+
+	mutex_lock(&chip->dma_mutex);
+	quantum_shutdown_audio_dma(chip);
+	mutex_unlock(&chip->dma_mutex);
+
+	mutex_lock(&chip->tci_tx_mutex);
+	quantum_disable_dma_engine(chip);
+	mutex_unlock(&chip->tci_tx_mutex);
+
+	/* No coherent mapping may be released while the endpoint can bus-master.=
 */
+	if (!pci_dev_is_disconnected(chip->pci))
+		pci_clear_master(chip->pci);
+	dev_dbg(&chip->pci->dev, "hardware DMA engines stopped\n");
+}
+
+static void snd_quantum_quiesce_surprise(struct snd_card *card)
+{
+	struct quantum_chip *chip =3D card->private_data;
+
+	if (!chip)
+		return;
+
+	quantum_begin_remove(chip);
+	quantum_mark_gone_locked(chip);
+	snd_quantum_drain_tci(chip);
+	snd_quantum_stop_async(card);
+}
+
+static void snd_quantum_release_resources(struct snd_card *card)
+{
+	struct quantum_chip *chip =3D card->private_data;
+	size_t cmd_bytes;
+
+	if (!chip)
+		return;
+
+	/* private_free may be reached outside the normal PCI remove path. */
+	if (!READ_ONCE(chip->removing))
+		snd_quantum_quiesce_surprise(card);
+
+	if (READ_ONCE(chip->resources_released))
+		return;
+	WRITE_ONCE(chip->resources_released, true);
+
+	/*
+	 * Release the slot only once truly done, not merely disconnected:
+	 * releasing it from .remove() let a fresh hot-add reuse the same
+	 * ALSA card index while the old, deferred-release instance was
+	 * still alive.
+	 */
+	quantum_release_card_slot(chip->card_slot);
+
+	dev_dbg(&chip->pci->dev, "releasing DMA and PCI resources\n");
+	quantum_cpu_latency_sysfs_remove(chip);
+
+	mutex_lock(&chip->dma_mutex);
+	chip->pcm_configured =3D 0;
+	chip->playback_configured_substream =3D NULL;
+	chip->capture_configured_substream =3D NULL;
+	quantum_free_dma_resources(chip);
+	mutex_unlock(&chip->dma_mutex);
+
+	/*
+	 * This can run long after the PCI core tore down this device's
+	 * IOMMU group, so skip the DMA-API teardown and leak instead of
+	 * touching a device that's already gone.
+	 */
+	cmd_bytes =3D chip->cmd_msg_count * chip->cmd_msg_size;
+	if (chip->cmd_tx_cpu) {
+		if (!pci_dev_is_disconnected(chip->pci))
+			dma_free_coherent(&chip->pci->dev, cmd_bytes,
+					  chip->cmd_tx_cpu, chip->cmd_tx_dma_base);
+		chip->cmd_tx_cpu =3D NULL;
+	}
+	if (chip->cmd_rx_cpu) {
+		if (!pci_dev_is_disconnected(chip->pci))
+			dma_free_coherent(&chip->pci->dev, cmd_bytes,
+					  chip->cmd_rx_cpu, chip->cmd_rx_dma_base);
+		chip->cmd_rx_cpu =3D NULL;
+	}
+	memset(chip->cmd_tx_slots, 0, sizeof(chip->cmd_tx_slots));
+	memset(chip->cmd_rx_slots, 0, sizeof(chip->cmd_rx_slots));
+	chip->dma_prepared =3D false;
+
+	if (chip->msi_allocated) {
+		pci_free_irq_vectors(chip->pci);
+		chip->msi_allocated =3D false;
+	}
+
+	if (chip->iobase) {
+		void __iomem *base =3D chip->iobase;
+
+		/*
+		 * Paired with the READ_ONCE() in quantum_iobase_or_null():
+		 * concurrent PCM/mixer/MIDI callbacks read chip->iobase
+		 * through that helper without any lock, so this write must
+		 * be a single atomic store, not something the compiler could
+		 * tear or reorder relative to pci_iounmap() below.
+		 */
+		WRITE_ONCE(chip->iobase, NULL);
+		pci_iounmap(chip->pci, base);
+	}
+
+	/*
+	 * By last-close a fresh hot-add may already have claimed the same
+	 * BAR range on a new struct pci_dev. pci_release_regions() touches
+	 * the global PCI resource tree, not just this pci_dev, so skip it
+	 * once disconnected -- the PCI core already reclaimed these regions
+	 * when it tore down the old slot.
+	 */
+	if (!pci_dev_is_disconnected(chip->pci)) {
+		pci_release_regions(chip->pci);
+		pci_disable_device(chip->pci);
+	}
+
+	dev_dbg(&chip->pci->dev, "resources released\n");
+
+	/* Balances pci_dev_get() in snd_quantum_probe(). */
+	pci_dev_put(chip->pci);
+}
+
+static void snd_quantum_free(struct snd_card *card)
+{
+	struct quantum_chip *chip =3D card->private_data;
+
+	if (!chip)
+		return;
+
+	snd_quantum_release_resources(card);
+	if (chip->cmd_wq) {
+		destroy_workqueue(chip->cmd_wq);
+		chip->cmd_wq =3D NULL;
+	}
+}
+
+/* PCI glue */
+
+static int snd_quantum_probe(struct pci_dev *pci,
+			     const struct pci_device_id *pci_id)
+{
+	struct snd_card *card;
+	struct quantum_chip *chip;
+	const struct quantum_device_entry *model;
+	int card_slot;
+	int err;
+
+	model =3D (const void *)pci_id->driver_data;
+	dev_dbg(&pci->dev, "probing PCI device %04x:%04x\n",
+		pci->vendor, pci->device);
+
+	card_slot =3D quantum_acquire_card_slot();
+	if (card_slot < 0)
+		return card_slot;
+	if (!enable[card_slot]) {
+		quantum_release_card_slot(card_slot);
+		return -ENOENT;
+	}
+
+	err =3D snd_card_new(&pci->dev, index[card_slot],
+			   id[card_slot] ? id[card_slot] : model->card_id,
+			   THIS_MODULE, sizeof(struct quantum_chip), &card);
+	if (err < 0) {
+		quantum_release_card_slot(card_slot);
+		return err;
+	}
+
+	chip =3D card->private_data;
+	chip->card_slot =3D card_slot;
+	err =3D snd_quantum_create(card, pci, model);
+	if (err < 0) {
+		quantum_release_card_slot(card_slot);
+		snd_card_free(card);
+		return err;
+	}
+
+	/*
+	 * Pin the pci_dev: on a surprise removal, teardown is deferred until
+	 * the last open file closes, well after the PCI core has torn down
+	 * this struct pci_dev. Balanced by pci_dev_put() in
+	 * snd_quantum_release_resources().
+	 */
+	pci_dev_get(pci);
+	card->private_free =3D snd_quantum_free;
+	strscpy(card->driver, DRV_NAME, sizeof(card->driver));
+	strscpy(card->shortname, model->name, sizeof(card->shortname));
+	snprintf(card->longname, sizeof(card->longname), "%s at %s",
+		 model->name, pci_name(pci));
+
+	err =3D snd_card_register(card);
+	if (err < 0) {
+		dev_err(&pci->dev, "failed to register sound card: %d\n", err);
+		quantum_release_card_slot(card_slot);
+		snd_card_free(card);
+		return err;
+	}
+
+	pci_set_drvdata(pci, card);
+	err =3D quantum_cpu_latency_sysfs_create(chip);
+	if (err) {
+		dev_err(&pci->dev,
+			"CPU latency sysfs creation failed: %d\n", err);
+		quantum_release_card_slot(card_slot);
+		snd_card_free(card);
+		pci_set_drvdata(pci, NULL);
+		return err;
+	}
+
+	dev_info(&pci->dev, "%s, ALSA card %d, %s IRQ %d\n",
+		 card->shortname, card->number,
+		 chip->msi_allocated ? "MSI" : "legacy", chip->irq);
+	return 0;
+}
+
+static void snd_quantum_remove(struct pci_dev *pci)
+{
+	struct snd_card *card =3D pci_get_drvdata(pci);
+	struct quantum_chip *chip;
+	bool surprise;
+
+	if (!card)
+		return;
+
+	chip =3D card->private_data;
+	surprise =3D pci_dev_is_disconnected(pci);
+	pci_set_drvdata(pci, NULL);
+	dev_dbg(&pci->dev, "removing sound card (%s removal)\n",
+		surprise ? "surprise" : "orderly");
+
+	quantum_cpu_latency_sysfs_remove(chip);
+
+	quantum_begin_remove(chip);
+	snd_quantum_drain_tci(chip);
+
+	if (surprise) {
+		/*
+		 * BAR access is no longer safe; quiesce only software state.
+		 * Do NOT use snd_card_disconnect_sync()/snd_card_free(): called
+		 * from the pciehp hotplug IST, they'd block until every open
+		 * file closes, stalling the PCI core's teardown indefinitely if
+		 * a client still has the device open. snd_card_free_when_closed()
+		 * disconnects immediately and defers release to last-close.
+		 *
+		 * Disconnect first so a client gets an immediate error instead
+		 * of a handle that still looks live while we tear things down.
+		 */
+		snd_card_disconnect(card);
+
+		quantum_mark_gone_locked(chip);
+
+		/*
+		 * ALSA core frees each PCM substream's preallocated buffer at
+		 * last-close via dma_free_attrs() on &chip->pci->dev, whose
+		 * DMA/IOMMU capability the PCI core tears down independently,
+		 * long before last-close, causing that automatic free to oops
+		 * in dma_free_contiguous(). A client's existing mmap of the
+		 * buffer also stays valid and in use until then (disconnect
+		 * doesn't revoke it), so we can't free the pages out from
+		 * under it either. Forget the buffer instead of freeing it:
+		 * do_free_pages() (pcm_memory.c) skips dmab->area =3D=3D NULL,
+		 * so ALSA core's later automatic free becomes a no-op and the
+		 * pages are simply leaked once per surprise removal.
+		 */
+		if (chip->pcm) {
+			struct snd_pcm_substream *substream;
+			int stream;
+
+			for_each_pcm_streams(stream) {
+				substream =3D chip->pcm->streams[stream].substream;
+				for (; substream; substream =3D substream->next)
+					substream->dma_buffer.area =3D NULL;
+			}
+		}
+
+		snd_quantum_stop_async(card);
+
+		/*
+		 * free_irq() above released the IRQ line, not the MSI vector
+		 * allocation. pci_stop_bus_device() tears down the MSI domain
+		 * right after this returns and WARNs in irq_domain_remove()
+		 * if vectors are still allocated, so free them here rather
+		 * than in the deferred release path.
+		 */
+		if (chip->msi_allocated) {
+			pci_free_irq_vectors(chip->pci);
+			chip->msi_allocated =3D false;
+		}
+
+		snd_card_free_when_closed(card);
+		dev_dbg(&pci->dev, "sound card disconnected after surprise removal\n");
+		return;
+	}
+
+	/*
+	 * Disconnect first so no userspace operation can race an orderly hardwar=
e
+	 * shutdown. This also waits for PCM hw_free() and close() release paths.
+	 */
+	dev_dbg(&pci->dev, "waiting for open ALSA files to close\n");
+	snd_card_disconnect_sync(card);
+
+	if (!surprise) {
+		/* Drain every asynchronous MMIO user before stopping the endpoint. */
+		snd_quantum_stop_async(card);
+		snd_quantum_shutdown_hardware(chip);
+		quantum_mark_gone_locked(chip);
+	}
+
+	snd_card_free(card);
+
+	dev_dbg(&pci->dev, "sound card removed\n");
+}
+
+static struct pci_driver quantum_driver =3D {
+	.name =3D DRV_NAME,
+	.id_table =3D quantum_ids,
+	.probe =3D snd_quantum_probe,
+	.remove =3D snd_quantum_remove,
+};
+
+module_pci_driver(quantum_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Nicholas Johnson <nicholas.johnson-opensource@outlook.com.a=
u>");
+MODULE_DESCRIPTION("PreSonus Quantum ALSA driver");
diff --git a/sound/pci/quantum/quantum_midi.c b/sound/pci/quantum/quantum_m=
idi.c
new file mode 100644
index 000000000..4b034dde0
--- /dev/null
+++ b/sound/pci/quantum/quantum_midi.c
@@ -0,0 +1,180 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright (C) 2026 Nicholas Johnson */
+#include "quantum.h"
+
+static int quantum_midi_input_open(struct snd_rawmidi_substream *substream=
)
+{
+	struct quantum_chip *chip =3D substream->rmidi->private_data;
+	unsigned long flags;
+
+	if (quantum_device_gone(chip))
+		return -ENODEV;
+	spin_lock_irqsave(&chip->midi_lock, flags);
+	chip->midi_input =3D substream;
+	spin_unlock_irqrestore(&chip->midi_lock, flags);
+	return 0;
+}
+
+static int quantum_midi_input_close(struct snd_rawmidi_substream *substrea=
m)
+{
+	struct quantum_chip *chip =3D substream->rmidi->private_data;
+	unsigned long flags;
+
+	if (quantum_device_gone(chip))
+		return 0;
+
+	spin_lock_irqsave(&chip->midi_lock, flags);
+	chip->midi_input_triggered =3D false;
+	chip->midi_input =3D NULL;
+	spin_unlock_irqrestore(&chip->midi_lock, flags);
+	return 0;
+}
+
+static void quantum_midi_input_trigger(struct snd_rawmidi_substream *subst=
ream,
+				       int up)
+{
+	struct quantum_chip *chip =3D substream->rmidi->private_data;
+	unsigned long flags;
+
+	if (quantum_device_gone(chip))
+		up =3D 0;
+	spin_lock_irqsave(&chip->midi_lock, flags);
+	chip->midi_input_triggered =3D up !=3D 0;
+	spin_unlock_irqrestore(&chip->midi_lock, flags);
+}
+
+static int quantum_midi_output_open(struct snd_rawmidi_substream *substrea=
m)
+{
+	struct quantum_chip *chip =3D substream->rmidi->private_data;
+	unsigned long flags;
+
+	if (quantum_device_gone(chip))
+		return -ENODEV;
+	spin_lock_irqsave(&chip->midi_lock, flags);
+	chip->midi_output =3D substream;
+	spin_unlock_irqrestore(&chip->midi_lock, flags);
+	return 0;
+}
+
+static int quantum_midi_output_close(struct snd_rawmidi_substream *substre=
am)
+{
+	struct quantum_chip *chip =3D substream->rmidi->private_data;
+	unsigned long flags;
+
+	spin_lock_irqsave(&chip->midi_lock, flags);
+	chip->midi_output_triggered =3D false;
+	chip->midi_output =3D NULL;
+	spin_unlock_irqrestore(&chip->midi_lock, flags);
+	cancel_work_sync(&chip->midi_tx_work);
+	return 0;
+}
+
+static void quantum_midi_output_trigger(struct snd_rawmidi_substream *subs=
tream,
+					int up)
+{
+	struct quantum_chip *chip =3D substream->rmidi->private_data;
+	unsigned long flags;
+
+	if (quantum_device_gone(chip))
+		up =3D 0;
+	spin_lock_irqsave(&chip->midi_lock, flags);
+	chip->midi_output_triggered =3D up !=3D 0;
+	spin_unlock_irqrestore(&chip->midi_lock, flags);
+	if (up && chip->cmd_wq)
+		queue_work(chip->cmd_wq, &chip->midi_tx_work);
+}
+
+static const struct snd_rawmidi_ops quantum_midi_input_ops =3D {
+	.open =3D quantum_midi_input_open,
+	.close =3D quantum_midi_input_close,
+	.trigger =3D quantum_midi_input_trigger,
+};
+
+static const struct snd_rawmidi_ops quantum_midi_output_ops =3D {
+	.open =3D quantum_midi_output_open,
+	.close =3D quantum_midi_output_close,
+	.trigger =3D quantum_midi_output_trigger,
+};
+
+void quantum_midi_receive(struct quantum_chip *chip, const u8 *payload,
+			  size_t payload_len)
+{
+	struct snd_rawmidi_substream *substream;
+	unsigned long flags;
+	u16 count;
+
+	if (payload_len < 4 || payload[0] !=3D 0)
+		return;
+	count =3D le16_to_cpup((const __le16 *)(payload + 2));
+	if (count > payload_len - 4)
+		return;
+	dev_dbg_ratelimited(&chip->pci->dev,
+			    "MIDI RX: port=3D%u bytes=3D%u\n", payload[0], count);
+
+	spin_lock_irqsave(&chip->midi_lock, flags);
+	substream =3D chip->midi_input;
+	if (substream && chip->midi_input_triggered)
+		snd_rawmidi_receive(substream, payload + 4, count);
+	spin_unlock_irqrestore(&chip->midi_lock, flags);
+}
+
+void quantum_midi_tx_work_handler(struct work_struct *work)
+{
+	struct quantum_chip *chip =3D container_of(work, struct quantum_chip,
+						 midi_tx_work);
+	u8 data[256];
+
+	if (quantum_device_gone(chip))
+		return;
+
+	for (;;) {
+		struct snd_rawmidi_substream *substream;
+		unsigned long flags;
+		int count, err;
+
+		spin_lock_irqsave(&chip->midi_lock, flags);
+		substream =3D chip->midi_output;
+		if (!substream || !chip->midi_output_triggered) {
+			spin_unlock_irqrestore(&chip->midi_lock, flags);
+			return;
+		}
+		spin_unlock_irqrestore(&chip->midi_lock, flags);
+
+		count =3D snd_rawmidi_transmit_peek(substream, data, sizeof(data));
+		if (count <=3D 0)
+			return;
+		err =3D quantum_tci_send_midi(chip, data, count);
+		if (err =3D=3D -EBUSY)
+			return;
+		if (err) {
+			dev_warn_ratelimited(&chip->pci->dev,
+					     "MIDI TX failed: %d\n", err);
+			return;
+		}
+		snd_rawmidi_transmit_ack(substream, count);
+	}
+}
+
+int quantum_midi_new(struct quantum_chip *chip)
+{
+	struct snd_rawmidi *rmidi;
+	char id[32];
+	int err;
+
+	strscpy(id, chip->model_id, sizeof(id));
+	err =3D snd_rawmidi_new(chip->card, id, 0, 1, 1, &rmidi);
+	if (err)
+		return err;
+	rmidi->private_data =3D chip;
+	snprintf(rmidi->name, sizeof(rmidi->name), "%s MIDI",
+		 chip->model_name);
+	rmidi->info_flags =3D SNDRV_RAWMIDI_INFO_INPUT |
+			    SNDRV_RAWMIDI_INFO_OUTPUT |
+			    SNDRV_RAWMIDI_INFO_DUPLEX;
+	snd_rawmidi_set_ops(rmidi, SNDRV_RAWMIDI_STREAM_INPUT,
+			    &quantum_midi_input_ops);
+	snd_rawmidi_set_ops(rmidi, SNDRV_RAWMIDI_STREAM_OUTPUT,
+			    &quantum_midi_output_ops);
+	chip->rmidi =3D rmidi;
+	return 0;
+}
diff --git a/sound/pci/quantum/quantum_mixer.c b/sound/pci/quantum/quantum_=
mixer.c
new file mode 100644
index 000000000..9dc76d91d
--- /dev/null
+++ b/sound/pci/quantum/quantum_mixer.c
@@ -0,0 +1,214 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright (C) 2026 Nicholas Johnson */
+#include "quantum.h"
+
+/* Sample-rate control */
+
+static int quantum_srate_info(struct snd_kcontrol *k,
+			      struct snd_ctl_elem_info *uinfo)
+{
+	struct quantum_chip *chip =3D k->private_data;
+	static const char * const rates[] =3D {
+		"44100", "48000", "88200", "96000", "176400", "192000"
+	};
+
+	if (quantum_device_gone(chip))
+		return -ENODEV;
+
+	return snd_ctl_enum_info(uinfo, 1, 6, rates);
+}
+
+static int quantum_srate_get(struct snd_kcontrol *k,
+			     struct snd_ctl_elem_value *u)
+{
+	struct quantum_chip *chip =3D k->private_data;
+
+	if (quantum_device_gone(chip))
+		return -ENODEV;
+
+	u->value.enumerated.item[0] =3D
+		(chip->sample_rate =3D=3D 44100) ? 0 :
+		(chip->sample_rate =3D=3D 48000) ? 1 :
+		(chip->sample_rate =3D=3D 88200) ? 2 :
+		(chip->sample_rate =3D=3D 96000) ? 3 :
+		(chip->sample_rate =3D=3D 176400) ? 4 : 5;
+
+	return 0;
+}
+
+static int quantum_srate_put(struct snd_kcontrol *k,
+			     struct snd_ctl_elem_value *u)
+{
+	struct quantum_chip *chip =3D k->private_data;
+	unsigned int rate;
+	unsigned int item =3D u->value.enumerated.item[0];
+	int err;
+
+	static const unsigned int map[] =3D {
+		44100, 48000, 88200, 96000, 176400, 192000
+	};
+
+	if (quantum_device_gone(chip))
+		return -ENODEV;
+
+	if (item >=3D ARRAY_SIZE(map))
+		return -EINVAL;
+	rate =3D map[item];
+	if (READ_ONCE(chip->sample_rate) =3D=3D rate)
+		return 0;
+
+	mutex_lock(&chip->dma_mutex);
+	if (quantum_device_gone(chip)) {
+		err =3D -ENODEV;
+		goto out;
+	}
+	if (chip->pcm_configured || READ_ONCE(chip->stream_active)) {
+		err =3D -EBUSY;
+		goto out;
+	}
+	err =3D quantum_set_sample_rate(chip, rate);
+out:
+	mutex_unlock(&chip->dma_mutex);
+	return err < 0 ? err : 1;
+}
+
+/* Clock-source control */
+
+static int quantum_clock_info(struct snd_kcontrol *k,
+			      struct snd_ctl_elem_info *uinfo)
+{
+	struct quantum_chip *chip =3D k->private_data;
+	static const char * const src[] =3D {
+		"Internal", "S/PDIF", "WordClock", "ADAT1", "ADAT2"
+	};
+
+	if (quantum_device_gone(chip))
+		return -ENODEV;
+
+	return snd_ctl_enum_info(uinfo, 1, 5, src);
+}
+
+static int quantum_clock_get(struct snd_kcontrol *k,
+			     struct snd_ctl_elem_value *u)
+{
+	struct quantum_chip *chip =3D k->private_data;
+
+	if (quantum_device_gone(chip))
+		return -ENODEV;
+
+	u->value.enumerated.item[0] =3D chip->clock_source;
+	return 0;
+}
+
+static int quantum_clock_put(struct snd_kcontrol *k,
+			     struct snd_ctl_elem_value *u)
+{
+	struct quantum_chip *chip =3D k->private_data;
+	unsigned int source =3D u->value.enumerated.item[0];
+	int err;
+
+	if (quantum_device_gone(chip))
+		return -ENODEV;
+
+	if (source > CLK_SOURCE_EXTERNAL_ADAT2)
+		return -EINVAL;
+	if (READ_ONCE(chip->clock_source) =3D=3D source)
+		return 0;
+
+	mutex_lock(&chip->dma_mutex);
+	if (quantum_device_gone(chip)) {
+		err =3D -ENODEV;
+		goto out;
+	}
+	if (chip->pcm_configured || READ_ONCE(chip->stream_active)) {
+		err =3D -EBUSY;
+		goto out;
+	}
+	err =3D quantum_set_clock_source(chip, source);
+out:
+	mutex_unlock(&chip->dma_mutex);
+	return err < 0 ? err : 1;
+}
+
+static int quantum_xrun_info(struct snd_kcontrol *k,
+			     struct snd_ctl_elem_info *uinfo)
+{
+	struct quantum_chip *chip =3D k->private_data;
+
+	if (quantum_device_gone(chip))
+		return -ENODEV;
+
+	uinfo->type =3D SNDRV_CTL_ELEM_TYPE_INTEGER64;
+	uinfo->count =3D 1;
+	uinfo->value.integer64.min =3D 0;
+	uinfo->value.integer64.max =3D S64_MAX;
+	return 0;
+}
+
+static int quantum_xrun_get(struct snd_kcontrol *k,
+			    struct snd_ctl_elem_value *u)
+{
+	struct quantum_chip *chip =3D k->private_data;
+	u64 count;
+
+	if (quantum_device_gone(chip))
+		return -ENODEV;
+
+	count =3D k->private_value ? chip->capture_xruns :
+		chip->playback_xruns;
+	u->value.integer64.value[0] =3D count;
+	return 0;
+}
+
+/* Control registration */
+
+int quantum_mixer_new(struct quantum_chip *chip)
+{
+	static const struct snd_kcontrol_new ctrls[] =3D {
+		{
+			.iface =3D SNDRV_CTL_ELEM_IFACE_MIXER,
+			.name =3D "Quantum Sample Rate",
+			.info =3D quantum_srate_info,
+			.get =3D quantum_srate_get,
+			.put =3D quantum_srate_put,
+		},
+		{
+			.iface =3D SNDRV_CTL_ELEM_IFACE_MIXER,
+			.name =3D "Quantum Clock Source",
+			.info =3D quantum_clock_info,
+			.get =3D quantum_clock_get,
+			.put =3D quantum_clock_put,
+		},
+		{
+			.iface =3D SNDRV_CTL_ELEM_IFACE_CARD,
+			.name =3D "Quantum Playback XRUN Count",
+			.access =3D SNDRV_CTL_ELEM_ACCESS_READ |
+				  SNDRV_CTL_ELEM_ACCESS_VOLATILE,
+			.info =3D quantum_xrun_info,
+			.get =3D quantum_xrun_get,
+		},
+		{
+			.iface =3D SNDRV_CTL_ELEM_IFACE_CARD,
+			.name =3D "Quantum Capture XRUN Count",
+			.access =3D SNDRV_CTL_ELEM_ACCESS_READ |
+				  SNDRV_CTL_ELEM_ACCESS_VOLATILE,
+			.info =3D quantum_xrun_info,
+			.get =3D quantum_xrun_get,
+			.private_value =3D 1,
+		},
+	};
+
+	int i;
+
+	if (quantum_device_gone(chip))
+		return -ENODEV;
+
+	for (i =3D 0; i < ARRAY_SIZE(ctrls); i++) {
+		int err =3D snd_ctl_add(chip->card,
+			snd_ctl_new1(&ctrls[i], chip));
+		if (err < 0)
+			return err;
+	}
+
+	return 0;
+}
diff --git a/sound/pci/quantum/quantum_pcm.c b/sound/pci/quantum/quantum_pc=
m.c
new file mode 100644
index 000000000..857d741ca
--- /dev/null
+++ b/sound/pci/quantum/quantum_pcm.c
@@ -0,0 +1,609 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright (C) 2026 Nicholas Johnson */
+#include "quantum.h"
+
+static const unsigned int quantum_channel_counts[] =3D { 26 };
+static const struct snd_pcm_hw_constraint_list quantum_channel_list =3D {
+	.count =3D ARRAY_SIZE(quantum_channel_counts),
+	.list =3D quantum_channel_counts,
+};
+
+static const unsigned int quantum_rates[] =3D {
+	44100, 48000, 88200, 96000, 176400, 192000,
+};
+
+static const struct snd_pcm_hw_constraint_list quantum_rate_list =3D {
+	.count =3D ARRAY_SIZE(quantum_rates),
+	.list =3D quantum_rates,
+};
+
+/*
+ * The hardware's real DMA service granularity doubles/quadruples above
+ * 48kHz and 96kHz (see quantum_hw_quantum()), so the set of period sizes
+ * that are actually usable differs per rate. Publish the exact per-rate
+ * table instead of one rate-independent list, so a properly-querying
+ * client only ever sees period sizes that will actually work.
+ */
+static const unsigned int quantum_period_sizes_1x[] =3D { 32, 64, 128, 256=
, 512 };
+static const unsigned int quantum_period_sizes_2x[] =3D { 64, 128, 256, 51=
2 };
+static const unsigned int quantum_period_sizes_4x[] =3D { 128, 256, 512 };
+
+static int quantum_pcm_hw_rule_period_size(struct snd_pcm_hw_params *param=
s,
+					   struct snd_pcm_hw_rule *rule)
+{
+	struct snd_interval *p =3D hw_param_interval(params,
+						   SNDRV_PCM_HW_PARAM_PERIOD_SIZE);
+	struct snd_interval *r =3D hw_param_interval(params,
+						   SNDRV_PCM_HW_PARAM_RATE);
+	const unsigned int *list =3D quantum_period_sizes_1x;
+	unsigned int count =3D ARRAY_SIZE(quantum_period_sizes_1x);
+
+	if (r->min > 96000) {
+		list =3D quantum_period_sizes_4x;
+		count =3D ARRAY_SIZE(quantum_period_sizes_4x);
+	} else if (r->min > 48000) {
+		list =3D quantum_period_sizes_2x;
+		count =3D ARRAY_SIZE(quantum_period_sizes_2x);
+	}
+
+	return snd_interval_list(p, count, list, 0);
+}
+
+static int quantum_pcm_open(struct snd_pcm_substream *ss)
+{
+	struct quantum_chip *chip =3D ss->pcm->private_data;
+	struct snd_pcm_runtime *runtime =3D ss->runtime;
+	u32 channel_cfg;
+	u32 channels;
+	int err;
+
+	if (quantum_device_gone(chip))
+		return -ENODEV;
+
+	if (chip->tci_fatal_error)
+		return -EIO;
+
+	if (!chip->tci_ready)
+		return -EAGAIN;
+
+	channel_cfg =3D quantum_read32(chip, QUANTUM_REG_CHANNEL_COUNTS);
+	channels =3D ss->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK ?
+		   ((channel_cfg >> 8) & 0xff) :
+		   (channel_cfg & 0xff);
+
+	if (!channels)
+		return -EIO;
+
+	if (channels !=3D 26)
+		return -EIO;
+
+	runtime->hw.info =3D SNDRV_PCM_INFO_MMAP |
+			   SNDRV_PCM_INFO_MMAP_VALID |
+			   SNDRV_PCM_INFO_INTERLEAVED |
+			   SNDRV_PCM_INFO_BLOCK_TRANSFER;
+	runtime->hw.formats =3D SNDRV_PCM_FMTBIT_S32_LE;
+	runtime->hw.rates =3D SNDRV_PCM_RATE_44100 |
+			    SNDRV_PCM_RATE_48000 |
+			    SNDRV_PCM_RATE_88200 |
+			    SNDRV_PCM_RATE_96000 |
+			    SNDRV_PCM_RATE_176400 |
+			    SNDRV_PCM_RATE_192000;
+	runtime->hw.rate_min =3D 44100;
+	runtime->hw.rate_max =3D 192000;
+	runtime->hw.channels_min =3D channels;
+	runtime->hw.channels_max =3D channels;
+	runtime->hw.period_bytes_min =3D 32 * channels * sizeof(s32);
+	runtime->hw.period_bytes_max =3D 512 * channels * sizeof(s32);
+	runtime->hw.periods_min =3D 1;
+	runtime->hw.periods_max =3D 1024;
+	runtime->hw.buffer_bytes_max =3D 65536 * channels * sizeof(s32);
+
+	err =3D snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_RATE,
+					 &quantum_rate_list);
+	if (err < 0)
+		return err;
+
+	err =3D snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_CHANNEL=
S,
+					 &quantum_channel_list);
+	if (err < 0)
+		return err;
+
+	err =3D snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_PERIOD_SIZE,
+				  quantum_pcm_hw_rule_period_size, NULL,
+				  SNDRV_PCM_HW_PARAM_RATE, -1);
+	if (err < 0)
+		return err;
+
+	err =3D snd_pcm_hw_constraint_integer(runtime,
+					    SNDRV_PCM_HW_PARAM_PERIODS);
+	if (err < 0)
+		return err;
+
+	err =3D snd_pcm_hw_constraint_minmax(runtime,
+					   SNDRV_PCM_HW_PARAM_BUFFER_SIZE,
+					   64, 65536);
+	if (err < 0)
+		return err;
+
+	return 0;
+}
+
+static int quantum_pcm_hw_params(struct snd_pcm_substream *ss,
+				 struct snd_pcm_hw_params *params)
+{
+	struct quantum_chip *chip =3D ss->pcm->private_data;
+	unsigned int rate =3D params_rate(params);
+	unsigned int hw_quantum =3D quantum_hw_quantum(rate,
+						     params_period_size(params));
+	struct snd_pcm_substream *playback_substream;
+	struct snd_pcm_substream *capture_substream;
+	int err;
+	int pages;
+
+	if (quantum_device_gone(chip))
+		return -ENODEV;
+
+	if (chip->tci_fatal_error)
+		return -EIO;
+
+	if (!chip->tci_ready)
+		return -EAGAIN;
+
+	pages =3D snd_pcm_lib_malloc_pages(ss, params_buffer_bytes(params));
+	if (pages < 0)
+		return pages;
+
+	mutex_lock(&chip->dma_mutex);
+
+	if (quantum_device_gone(chip)) {
+		err =3D -ENODEV;
+		goto out_free_pages;
+	}
+
+	if (chip->pcm_configured &&
+	    !(chip->pcm_configured & BIT(ss->stream)) &&
+	    (chip->current_sample_rate !=3D rate ||
+	     chip->dma_quantum_frames !=3D hw_quantum ||
+	     chip->buffer_frames !=3D params_buffer_size(params))) {
+		err =3D -EBUSY;
+		goto out_free_pages;
+	}
+
+	playback_substream =3D READ_ONCE(chip->playback_configured_substream);
+	capture_substream =3D READ_ONCE(chip->capture_configured_substream);
+	if (ss->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK) {
+		playback_substream =3D ss;
+		WRITE_ONCE(chip->playback_configured_substream, ss);
+	} else {
+		capture_substream =3D ss;
+		WRITE_ONCE(chip->capture_configured_substream, ss);
+	}
+
+	err =3D quantum_set_sample_rate(chip, rate);
+	if (err < 0) {
+		dev_err(&chip->pci->dev,
+			"Set sample rate failed: %d\n", err);
+		goto out_free_pages;
+	}
+
+	err =3D quantum_allocate_dma_resources(chip, rate,
+					     params_period_size(params),
+					     params_buffer_size(params),
+					     playback_substream,
+					     capture_substream);
+	if (err) {
+		dev_err(&chip->pci->dev,
+			"DMA allocation failed: %d\n", err);
+		goto out_free_pages;
+	}
+
+	chip->pcm_configured |=3D BIT(ss->stream);
+
+	dev_dbg(&chip->pci->dev,
+		"configured %u Hz, %u channels, period %lu, buffer %lu\n",
+		rate, params_channels(params),
+		(unsigned long)params_period_size(params),
+		(unsigned long)params_buffer_size(params));
+
+	mutex_unlock(&chip->dma_mutex);
+	return 0;
+
+out_free_pages:
+	if (!(chip->pcm_configured & BIT(ss->stream))) {
+		if (ss->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK)
+			WRITE_ONCE(chip->playback_configured_substream, NULL);
+		else
+			WRITE_ONCE(chip->capture_configured_substream, NULL);
+	}
+
+	mutex_unlock(&chip->dma_mutex);
+	snd_pcm_lib_free_pages(ss);
+	return err;
+}
+
+static void quantum_pcm_forget_substream_locked(struct quantum_chip *chip,
+						struct snd_pcm_substream *ss)
+{
+	if (ss->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK) {
+		if (READ_ONCE(chip->playback_substream) =3D=3D ss) {
+			chip->playback_attach_pending =3D false;
+			WRITE_ONCE(chip->playback_substream, NULL);
+			dev_info(&chip->pci->dev, "pcm forget: playback\n");
+		}
+		if (READ_ONCE(chip->playback_configured_substream) =3D=3D ss)
+			WRITE_ONCE(chip->playback_configured_substream, NULL);
+	} else {
+		if (READ_ONCE(chip->capture_substream) =3D=3D ss) {
+			chip->capture_attach_pending =3D false;
+			WRITE_ONCE(chip->capture_substream, NULL);
+			dev_info(&chip->pci->dev, "pcm forget: capture\n");
+		}
+		if (READ_ONCE(chip->capture_configured_substream) =3D=3D ss)
+			WRITE_ONCE(chip->capture_configured_substream, NULL);
+	}
+}
+
+static int quantum_pcm_close(struct snd_pcm_substream *ss)
+{
+	struct quantum_chip *chip =3D ss->pcm->private_data;
+
+	if (quantum_device_gone(chip))
+		return 0;
+
+	mutex_lock(&chip->dma_mutex);
+	if (!quantum_device_gone(chip)) {
+		dev_info(&chip->pci->dev,
+			 "pcm close: %s state=3D%d active=3D%u configured=3D0x%x play=3D%u cap=
=3D%u\n",
+			 ss->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK ?
+			 "playback" : "capture",
+			 ss->runtime ? READ_ONCE(ss->runtime->state) : -1,
+			 READ_ONCE(chip->stream_active), chip->pcm_configured,
+			 !!READ_ONCE(chip->playback_substream),
+			 !!READ_ONCE(chip->capture_substream));
+		quantum_pcm_forget_substream_locked(chip, ss);
+	}
+	mutex_unlock(&chip->dma_mutex);
+
+	return 0;
+}
+
+static int quantum_pcm_hw_free(struct snd_pcm_substream *ss)
+{
+	struct quantum_chip *chip =3D ss->pcm->private_data;
+	unsigned int rate;
+	unsigned int period;
+	unsigned int buffer;
+	bool restart;
+	int err =3D 0;
+
+	/* disconnect_sync() prevents final resource release until this returns. =
*/
+	if (quantum_device_gone(chip))
+		return snd_pcm_lib_free_pages(ss);
+
+	mutex_lock(&chip->dma_mutex);
+	if (quantum_device_gone(chip)) {
+		mutex_unlock(&chip->dma_mutex);
+		return snd_pcm_lib_free_pages(ss);
+	}
+
+	rate =3D chip->current_sample_rate;
+	period =3D chip->period_frames;
+	buffer =3D chip->buffer_frames;
+
+	/*
+	 * This device has one shared audio DMA engine and one pair of global
+	 * playback/capture page-table roots.  If one direction is freed while
+	 * the opposite direction is still active, stop the engine, rebuild the
+	 * global tables with dummy pages only for the freed direction, then
+	 * restart the surviving stream.  Do not reject the later direction in
+	 * hw_params(); full-duplex userspace commonly opens capture while
+	 * playback is already running.
+	 */
+	restart =3D READ_ONCE(chip->stream_active) &&
+		(ss->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK ?
+		 READ_ONCE(chip->capture_substream) :
+		 READ_ONCE(chip->playback_substream));
+
+	dev_info(&chip->pci->dev,
+		 "pcm hw_free: %s state=3D%d restart=3D%u active=3D%u configured=3D0x%x =
play=3D%u cap=3D%u\n",
+		 ss->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK ?
+		 "playback" : "capture",
+		 ss->runtime ? READ_ONCE(ss->runtime->state) : -1,
+		 restart, READ_ONCE(chip->stream_active), chip->pcm_configured,
+		 !!READ_ONCE(chip->playback_substream),
+		 !!READ_ONCE(chip->capture_substream));
+
+	quantum_pcm_forget_substream_locked(chip, ss);
+	chip->pcm_configured &=3D ~BIT(ss->stream);
+
+	quantum_free_dma_resources(chip);
+	if (chip->pcm_configured) {
+		err =3D quantum_allocate_dma_resources(chip, rate, period, buffer,
+						     READ_ONCE(chip->playback_configured_substream),
+						     READ_ONCE(chip->capture_configured_substream));
+		if (!err && restart)
+			err =3D quantum_start_dma(chip);
+	}
+
+	mutex_unlock(&chip->dma_mutex);
+	snd_pcm_lib_free_pages(ss);
+	return err;
+}
+
+static void quantum_silence_playback_runtime(struct quantum_chip *chip,
+					     struct snd_pcm_substream *ss)
+{
+	struct snd_pcm_runtime *runtime =3D ss->runtime;
+
+	if (ss->stream !=3D SNDRV_PCM_STREAM_PLAYBACK || !runtime)
+		return;
+
+	if (!runtime->dma_area || !runtime->dma_bytes)
+		return;
+
+	memset(runtime->dma_area, 0, runtime->dma_bytes);
+	/* Ensure silence is visible before the hardware can fetch after START. *=
/
+	dma_wmb();
+
+	chip->playback_period_accum =3D 0;
+}
+
+static int quantum_pcm_prepare(struct snd_pcm_substream *ss)
+{
+	struct quantum_chip *chip =3D ss->pcm->private_data;
+
+	if (quantum_device_gone(chip))
+		return -ENODEV;
+
+	if (chip->tci_fatal_error)
+		return -EIO;
+
+	if (!chip->tci_ready)
+		return -EAGAIN;
+
+	if (!READ_ONCE(chip->dma_resources_allocated))
+		return -EINVAL;
+
+	/*
+	 * period_frames, buffer_frames, and the playback/capture period
+	 * accumulators are also touched by the audio IRQ thread
+	 * (quantum_process_audio() in quantum_main.c), which takes this same
+	 * dma_mutex around its read/modify/write of these fields. Unlike that
+	 * function, prepare() never calls snd_pcm_period_elapsed() (that only
+	 * happens in the IRQ thread), so there is no reentrancy hazard in
+	 * holding the lock for this whole function.
+	 */
+	mutex_lock(&chip->dma_mutex);
+
+	if (READ_ONCE(ss->runtime->state) =3D=3D SNDRV_PCM_STATE_XRUN) {
+		if (ss->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK) {
+			chip->playback_xruns++;
+			quantum_silence_playback_runtime(chip, ss);
+		} else {
+			chip->capture_xruns++;
+		}
+
+		dev_warn_ratelimited(&chip->pci->dev,
+				     "recovering %s XRUN (playback=3D%llu capture=3D%llu)\n",
+			ss->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK ?
+			"playback" : "capture",
+			(unsigned long long)chip->playback_xruns,
+			(unsigned long long)chip->capture_xruns);
+	} else if (ss->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK &&
+		   READ_ONCE(chip->stream_active)) {
+		/*
+		 * Playback may be prepared while capture keeps the shared DMA engine
+		 * running.  The hardware can fetch from the absolute ring slot before
+		 * userspace has refilled it, so make stale contents deterministic.
+		 */
+		quantum_silence_playback_runtime(chip, ss);
+	}
+
+	chip->period_frames =3D ss->runtime->period_size;
+	chip->buffer_frames =3D ss->runtime->buffer_size;
+
+	if (ss->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK)
+		chip->playback_period_accum =3D 0;
+	else
+		chip->capture_period_accum =3D 0;
+
+	mutex_unlock(&chip->dma_mutex);
+	return 0;
+}
+
+static int quantum_pcm_trigger(struct snd_pcm_substream *ss, int cmd)
+{
+	struct quantum_chip *chip =3D ss->pcm->private_data;
+	int err =3D 0;
+
+	if (quantum_device_gone(chip))
+		return -ENODEV;
+
+	mutex_lock(&chip->dma_mutex);
+
+	if (quantum_device_gone(chip)) {
+		err =3D -ENODEV;
+		goto out;
+	}
+
+	if (chip->tci_fatal_error) {
+		err =3D -EIO;
+		goto out;
+	}
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_RESUME:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		/*
+		 * If the opposite direction is already running, this substream is
+		 * joining a shared hardware ring in the middle of a cycle.  Mark it
+		 * pending so pointer() and period wakeups remain at zero until the
+		 * ring naturally reaches frame zero.
+		 */
+		if (ss->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK) {
+			chip->playback_attach_pending =3D
+				READ_ONCE(chip->stream_active) &&
+				READ_ONCE(chip->capture_substream) &&
+				chip->last_dma_pos;
+			chip->playback_period_accum =3D 0;
+			WRITE_ONCE(chip->playback_substream, ss);
+		} else {
+			chip->capture_attach_pending =3D
+				READ_ONCE(chip->stream_active) &&
+				READ_ONCE(chip->playback_substream) &&
+				chip->last_dma_pos;
+			chip->capture_period_accum =3D 0;
+			WRITE_ONCE(chip->capture_substream, ss);
+		}
+
+		if (!READ_ONCE(chip->stream_active)) {
+			err =3D quantum_start_dma(chip);
+			if (err) {
+				if (ss->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK)
+					WRITE_ONCE(chip->playback_substream, NULL);
+				else
+					WRITE_ONCE(chip->capture_substream, NULL);
+			}
+		}
+		if (!err)
+			dev_dbg(&chip->pci->dev,
+				"pcm trigger: %s cmd=3D%d state=3D%d active=3D%u configured=3D0x%x pla=
y=3D%u cap=3D%u\n",
+				ss->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK ?
+				"playback" : "capture", cmd,
+				READ_ONCE(ss->runtime->state),
+				READ_ONCE(chip->stream_active),
+				chip->pcm_configured,
+				!!READ_ONCE(chip->playback_substream),
+				!!READ_ONCE(chip->capture_substream));
+		break;
+
+	case SNDRV_PCM_TRIGGER_STOP:
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+		if (ss->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK) {
+			chip->playback_attach_pending =3D false;
+			WRITE_ONCE(chip->playback_substream, NULL);
+		} else {
+			chip->capture_attach_pending =3D false;
+			WRITE_ONCE(chip->capture_substream, NULL);
+		}
+
+		if (!READ_ONCE(chip->playback_substream) &&
+		    !READ_ONCE(chip->capture_substream))
+			quantum_stop_dma(chip);
+		dev_dbg(&chip->pci->dev,
+			"pcm trigger: %s cmd=3D%d state=3D%d active=3D%u configured=3D0x%x play=
=3D%u cap=3D%u\n",
+			ss->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK ?
+			"playback" : "capture", cmd,
+			READ_ONCE(ss->runtime->state),
+			READ_ONCE(chip->stream_active),
+			chip->pcm_configured,
+			!!READ_ONCE(chip->playback_substream),
+			!!READ_ONCE(chip->capture_substream));
+		break;
+
+	default:
+		err =3D -EINVAL;
+		break;
+	}
+
+out:
+	mutex_unlock(&chip->dma_mutex);
+	return err;
+}
+
+static int quantum_pcm_ack(struct snd_pcm_substream *ss)
+{
+	struct quantum_chip *chip =3D ss->pcm->private_data;
+
+	if (quantum_device_gone(chip))
+		return -ENODEV;
+
+	if (ss->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK)
+		/* Ensure newly written playback frames are visible to DMA. */
+		dma_wmb();
+
+	return 0;
+}
+
+static snd_pcm_uframes_t
+quantum_pcm_pointer(struct snd_pcm_substream *ss)
+{
+	struct quantum_chip *chip =3D ss->pcm->private_data;
+	struct snd_pcm_runtime *runtime =3D ss->runtime;
+	u32 raw;
+	u32 ring_pos;
+	u64 absolute_pos;
+
+	if (quantum_device_gone(chip))
+		return SNDRV_PCM_POS_XRUN;
+
+	if (!runtime || !runtime->buffer_size)
+		return 0;
+
+	if (!READ_ONCE(chip->stream_active) ||
+	    !READ_ONCE(chip->dma_resources_allocated) ||
+	    !chip->dma_ring_frames)
+		return 0;
+
+	if (ss->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK) {
+		if (READ_ONCE(chip->playback_attach_pending))
+			return 0;
+	} else if (READ_ONCE(chip->capture_attach_pending)) {
+		return 0;
+	}
+
+	raw =3D quantum_read32(chip, QUANTUM_REG_DMA_POSITION);
+	if (raw =3D=3D U32_MAX || quantum_device_gone(chip))
+		return SNDRV_PCM_POS_XRUN;
+
+	ring_pos =3D raw & 0x000fffff;
+	if (ring_pos >=3D chip->dma_ring_frames)
+		return 0;
+
+	absolute_pos =3D ring_pos % runtime->buffer_size;
+	return (snd_pcm_uframes_t)absolute_pos;
+}
+
+static const struct snd_pcm_ops quantum_ops =3D {
+	.open =3D quantum_pcm_open,
+	.close =3D quantum_pcm_close,
+	.hw_params =3D quantum_pcm_hw_params,
+	.hw_free =3D quantum_pcm_hw_free,
+	.prepare =3D quantum_pcm_prepare,
+	.trigger =3D quantum_pcm_trigger,
+	.pointer =3D quantum_pcm_pointer,
+	.ack =3D quantum_pcm_ack,
+};
+
+int snd_quantum_pcm_new(struct quantum_chip *chip)
+{
+	struct snd_pcm *pcm;
+	int err;
+
+	if (quantum_device_gone(chip))
+		return -ENODEV;
+
+	err =3D snd_pcm_new(chip->card, chip->model_id,
+			  0, 1, 1, &pcm);
+	if (err < 0)
+		return err;
+
+	pcm->private_data =3D chip;
+	pcm->nonatomic =3D true;
+	strscpy(pcm->name, chip->model_name,
+		sizeof(pcm->name));
+	chip->pcm =3D pcm;
+
+	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_PLAYBACK,
+			&quantum_ops);
+	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_CAPTURE,
+			&quantum_ops);
+
+	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV_SG,
+					      &chip->pci->dev, 64 * 1024,
+					      16 * 1024 * 1024);
+
+	return 0;
+}
diff --git a/sound/pci/quantum/quantum_regs.h b/sound/pci/quantum/quantum_r=
egs.h
new file mode 100644
index 000000000..5e7f2a0b1
--- /dev/null
+++ b/sound/pci/quantum/quantum_regs.h
@@ -0,0 +1,52 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright (C) 2026 Nicholas Johnson */
+#ifndef QUANTUM_REGS_H
+#define QUANTUM_REGS_H
+
+/* Version and configuration */
+#define QUANTUM_REG_FPGA_BL_VER			        0x00000
+#define QUANTUM_REG_FPGA_IMAGE_VER		        0x00004
+#define QUANTUM_REG_FPGA_IFC_VER		        0x00008
+#define QUANTUM_REG_MCU_BL_VER			        0x00010
+#define QUANTUM_REG_MCU_MAIN_VER		        0x00014
+#define QUANTUM_REG_DMA_STATUS			        0x00070
+#define QUANTUM_REG_TX_SLOT_STATUS		        0x00074
+#define QUANTUM_REG_RX_SLOT_STATUS		        0x00078
+#define QUANTUM_REG_CMD_MSG_CONFIG		        0x0007c
+#define QUANTUM_REG_RX_LEN_READBACK_BASE	    0x00080
+#define QUANTUM_REG_DFU_PAYLOAD_SIZE		    0x00104
+
+/* Command DMA */
+#define QUANTUM_REG_DMA_CONTROL			        0x01000
+#define QUANTUM_REG_TX_SW_POS			        0x01004
+#define QUANTUM_REG_RX_SW_POS			        0x01008
+#define QUANTUM_REG_CMD_TX_ADDR_BASE		    0x01010
+#define QUANTUM_REG_CMD_TX_LEN_BASE		        0x01090
+#define QUANTUM_REG_CMD_RX_ADDR_BASE		    0x010d0
+#define QUANTUM_REG_DFU_CONTROL			        0x01300
+
+/* Audio DMA and interrupts */
+#define QUANTUM_REG_DMA_STOP_STATUS		        0x10000
+#define QUANTUM_REG_INTERRUPT_STATUS		    0x10004
+#define QUANTUM_REG_DMA_POSITION		        0x10104
+#define QUANTUM_REG_CHANNEL_COUNTS		        0x10200
+#define QUANTUM_REG_ADDR_PER_SEGMENT		    0x10300
+#define QUANTUM_REG_ADDR_PER_SEGMENT2		    0x10304
+#define QUANTUM_REG_PAGE_TABLE_STATUS		    0x10308
+#define QUANTUM_REG_DMA_START			        0x11000
+#define QUANTUM_REG_DMA_INT_ENABLE		        0x11004
+
+/* Audio DMA page tables */
+#define QUANTUM_REG_REC_PAGE_TABLE_ADDR_LOW	    0x11100
+#define QUANTUM_REG_REC_PAGE_TABLE_ADDR_HIGH	0x11104
+#define QUANTUM_REG_REC_BLOCK_COUNT		        0x11108
+#define QUANTUM_REG_REC_BLOCK_SIZE		        0x1110c
+#define QUANTUM_REG_PLAY_PAGE_TABLE_ADDR_LOW	0x11110
+#define QUANTUM_REG_PLAY_PAGE_TABLE_ADDR_HIGH	0x11114
+#define QUANTUM_REG_PLAY_BLOCK_COUNT		    0x11118
+#define QUANTUM_REG_PLAY_BLOCK_SIZE		        0x1111c
+
+#define QUANTUM_INT_DMA				            0x00000100
+#define QUANTUM_INT_CMD_RX			            0x80000000
+
+#endif
diff --git a/sound/pci/quantum/quantum_tci.c b/sound/pci/quantum/quantum_tc=
i.c
new file mode 100644
index 000000000..59a697b97
--- /dev/null
+++ b/sound/pci/quantum/quantum_tci.c
@@ -0,0 +1,486 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright (C) 2026 Nicholas Johnson */
+#include "quantum.h"
+
+static int quantum_get_tx_slot(struct quantum_chip *chip, u32 *slot)
+{
+	u32 hw =3D quantum_read32(chip, QUANTUM_REG_TX_SLOT_STATUS);
+	u32 sw =3D quantum_read32(chip, QUANTUM_REG_TX_SW_POS);
+	u32 next;
+
+	if (hw >=3D chip->cmd_msg_count || sw >=3D chip->cmd_msg_count)
+		return -EIO;
+
+	/* Keep one slot empty so equal producer/consumer indices mean empty. */
+	next =3D (sw + 1) % chip->cmd_msg_count;
+	if (next =3D=3D hw)
+		return -EBUSY;
+
+	*slot =3D sw;
+	return 0;
+}
+
+static int quantum_get_next_rx_slot(struct quantum_chip *chip)
+{
+	u32 hw =3D quantum_read32(chip, QUANTUM_REG_RX_SLOT_STATUS);
+	u32 sw =3D quantum_read32(chip, QUANTUM_REG_RX_SW_POS);
+	u32 count =3D chip->cmd_msg_count;
+	u32 available;
+
+	if (hw >=3D count || sw >=3D count)
+		return -EIO;
+
+	if (hw >=3D sw)
+		available =3D hw - sw;
+	else
+		available =3D hw + count - sw;
+
+	if (!available)
+		return -ENODATA;
+
+	return sw;
+}
+
+/* Advance the TX producer index */
+
+static void quantum_inc_tx_sw_pos(struct quantum_chip *chip, u32 slot)
+{
+	quantum_write32(chip, QUANTUM_REG_TX_SW_POS,
+			(slot + 1) % chip->cmd_msg_count);
+}
+
+/* Advance the RX consumer index */
+
+static void quantum_inc_rx_sw_pos(struct quantum_chip *chip, u32 slot)
+{
+	quantum_write32(chip, QUANTUM_REG_RX_SW_POS,
+			(slot + 1) % chip->cmd_msg_count);
+}
+
+/* Mark the command interface ready */
+
+static void quantum_tci_mark_ready(struct quantum_chip *chip)
+{
+	if (!chip->tci_ready) {
+		chip->tci_ready =3D true;
+		chip->tci_initialized =3D true;
+	}
+}
+
+void quantum_process_rx_messages(struct quantum_chip *chip)
+{
+	int slot;
+
+	if (quantum_device_gone(chip))
+		return;
+
+	for (;;) {
+		u8 *msg;
+		u32 hw_len;
+		u8 channel, code;
+		u16 tid;
+		void *payload;
+		size_t payload_len;
+		u16 header_len;
+
+		slot =3D quantum_get_next_rx_slot(chip);
+		if (slot =3D=3D -ENODATA)
+			break;
+		if (slot < 0) {
+			dev_err_ratelimited(&chip->pci->dev,
+					    "invalid command RX ring position\n");
+			break;
+		}
+
+		msg =3D chip->cmd_rx_slots[slot];
+		hw_len =3D quantum_read32(chip,
+					QUANTUM_REG_RX_LEN_READBACK_BASE + slot * 4);
+		if (hw_len < sizeof(struct tci_header)) {
+			dev_warn_ratelimited(&chip->pci->dev,
+					     "RX slot %d has invalid length %u\n", slot, hw_len);
+			quantum_inc_rx_sw_pos(chip, slot);
+			continue;
+		}
+
+		header_len =3D le16_to_cpu(*(__le16 *)msg);
+		if (header_len < sizeof(struct tci_header) ||
+		    header_len > chip->cmd_msg_size) {
+			dev_warn_ratelimited(&chip->pci->dev,
+					     "RX slot %d has invalid header length %u\n",
+				slot, header_len);
+			quantum_inc_rx_sw_pos(chip, slot);
+			continue;
+		}
+
+		if (header_len !=3D hw_len) {
+			dev_warn_ratelimited(&chip->pci->dev,
+					     "RX slot %d length mismatch: hardware=3D%u header=3D%u\n",
+				slot, hw_len, header_len);
+			if (header_len > hw_len)
+				header_len =3D hw_len;
+		}
+
+		channel =3D msg[2];
+		code =3D msg[3];
+		tid =3D le16_to_cpu(*(__le16 *)(msg + 4));
+		payload =3D msg + sizeof(struct tci_header);
+		payload_len =3D header_len - sizeof(struct tci_header);
+		dev_dbg(&chip->pci->dev,
+			"TCI RX: slot=3D%d tid=3D%u channel=3D0x%02x code=3D0x%02x length=3D%u\=
n",
+			slot, tid, channel, code, header_len);
+
+		if (channel =3D=3D TCI_CHAN_CMD_RESP || channel =3D=3D TCI_CHAN_CTRL) {
+			struct quantum_tci_cmd *cmd, *tmp;
+			bool found =3D false;
+
+			spin_lock(&chip->cmd_lock);
+			list_for_each_entry_safe(cmd, tmp, &chip->pending_cmds, list) {
+				if (cmd->tid =3D=3D tid && !cmd->responded) {
+					cmd->responded =3D true;
+					cmd->response_code =3D code;
+					cmd->response_len =3D min(payload_len,
+								sizeof(cmd->response_data));
+					if (cmd->response_len)
+						memcpy(cmd->response_data, payload,
+						       cmd->response_len);
+					complete(&cmd->done);
+					found =3D true;
+					break;
+				}
+			}
+			spin_unlock(&chip->cmd_lock);
+
+			if (!found)
+				dev_warn_ratelimited(&chip->pci->dev,
+						     "RX transaction %u has no pending command\n",
+						     tid);
+		}
+
+		if (channel =3D=3D TCI_CHAN_CTRL_EVENT) {
+			switch (code) {
+			case TCI_EVT_CLOCK_STATUS:
+				if (payload_len >=3D 8) {
+					u32 wire_cs =3D le32_to_cpu(*(__le32 *)payload);
+					u32 sr =3D le32_to_cpu(*(__le32 *)(payload + 4));
+
+					if (wire_cs < 1 || wire_cs > 5) {
+						dev_warn_ratelimited(&chip->pci->dev,
+								     "invalid clock source event: %u\n",
+							wire_cs);
+						break;
+					}
+					dev_dbg(&chip->pci->dev,
+						"clock event: source=3D%u rate=3D%u\n",
+						wire_cs - 1, sr);
+					chip->clock_source =3D wire_cs - 1;
+					chip->sample_rate =3D sr;
+				}
+				break;
+
+			case TCI_EVT_POWER_STATE:
+				if (payload_len >=3D 4) {
+					u32 state =3D le32_to_cpu(*(__le32 *)payload);
+
+					dev_dbg(&chip->pci->dev, "power event: %s\n",
+						state ? "on" : "off");
+					quantum_power_state_changed(chip, state !=3D 0);
+				}
+				break;
+
+			default:
+				dev_dbg(&chip->pci->dev,
+					"unknown event code 0x%02x\n", code);
+				break;
+			}
+		}
+
+		if (channel =3D=3D TCI_CHAN_MIDI_RX && code =3D=3D TCI_EVT_MIDI_RX)
+			quantum_midi_receive(chip, payload, payload_len);
+		if (channel =3D=3D TCI_CHAN_MIDI_TX && code =3D=3D TCI_EVT_MIDI_TX_FREE =
&&
+		    chip->midi_output_triggered)
+			queue_work(chip->cmd_wq, &chip->midi_tx_work);
+
+		quantum_inc_rx_sw_pos(chip, slot);
+	}
+}
+
+static int quantum_tci_send_wait(struct quantum_chip *chip, u8 channel,
+				 u8 code, u8 expected_rsp, void *tx_data,
+				 size_t tx_len, void *rx_data, size_t *rx_len,
+				 int timeout_ms)
+{
+	struct tci_header *hdr;
+	struct quantum_tci_cmd cmd;
+	u32 slot;
+	int retry;
+	int ret;
+	unsigned long flags;
+	u32 hw_len;
+	size_t total_tx_len;
+
+	if (chip->tci_fatal_error)
+		return -EIO;
+
+	if (quantum_device_gone(chip))
+		return -ENODEV;
+
+	if (!chip->tci_initialized)
+		return -EIO;
+
+	total_tx_len =3D sizeof(struct tci_header) + tx_len;
+
+	if (total_tx_len > chip->cmd_msg_size) {
+		dev_err(&chip->pci->dev, "TCI TX too large: %zu > %u\n",
+			total_tx_len, chip->cmd_msg_size);
+		return -EINVAL;
+	}
+
+	mutex_lock(&chip->tci_tx_mutex);
+	if (quantum_device_gone(chip) || !chip->tci_initialized) {
+		mutex_unlock(&chip->tci_tx_mutex);
+		return -ENODEV;
+	}
+	memset(&cmd, 0, sizeof(cmd));
+	cmd.tid =3D chip->next_tid++;
+	init_completion(&cmd.done);
+
+	spin_lock_irqsave(&chip->cmd_lock, flags);
+	list_add_tail(&cmd.list, &chip->pending_cmds);
+	spin_unlock_irqrestore(&chip->cmd_lock, flags);
+
+	/* Get slot - short retries */
+	for (retry =3D 0; retry < 50; retry++) {
+		ret =3D quantum_get_tx_slot(chip, &slot);
+		if (ret !=3D -EBUSY)
+			break;
+		usleep_range(100, 200);
+	}
+	if (ret) {
+		mutex_unlock(&chip->tci_tx_mutex);
+		spin_lock_irqsave(&chip->cmd_lock, flags);
+		list_del(&cmd.list);
+		spin_unlock_irqrestore(&chip->cmd_lock, flags);
+		return ret;
+	}
+
+	/* Build the message in the TX slot */
+	hdr =3D chip->cmd_tx_slots[slot];
+	memset(hdr, 0, chip->cmd_msg_size);
+
+	hdr->length =3D cpu_to_le16(total_tx_len);
+	hdr->reserved =3D 0;
+	hdr->channel =3D channel;
+	hdr->code =3D code;
+	hdr->tid =3D cpu_to_le16(cmd.tid);
+
+	/* Payload (if any) goes right after the header */
+	if (tx_data && tx_len)
+		memcpy((u8 *)hdr + sizeof(struct tci_header), tx_data, tx_len);
+
+	/* Make coherent TX contents visible before ringing the doorbell. */
+	dma_wmb();
+
+	dev_dbg(&chip->pci->dev,
+		"TCI TX: slot=3D%u tid=3D%u channel=3D0x%02x code=3D0x%02x length=3D%zu\=
n",
+		slot, cmd.tid, channel, code, total_tx_len);
+
+	/* Write TX_LEN =3D total message length (header + payload) */
+	quantum_write32(chip, QUANTUM_REG_CMD_TX_LEN_BASE + slot * 4, total_tx_le=
n);
+
+	/* Read back RX_LEN for sanity check */
+	hw_len =3D quantum_read32(chip, QUANTUM_REG_RX_LEN_READBACK_BASE + slot *=
 4);
+	dev_dbg(&chip->pci->dev,
+		"TCI slot %u length readback: TX=3D%zu RX=3D%u\n",
+		slot, total_tx_len, hw_len);
+
+	/* Advance TX pointer - signals hardware to process */
+	quantum_write32(chip, QUANTUM_REG_TX_SW_POS, (slot + 1) % chip->cmd_msg_c=
ount);
+	mutex_unlock(&chip->tci_tx_mutex);
+
+	/* Wait for completion */
+	ret =3D wait_for_completion_timeout(&cmd.done, msecs_to_jiffies(timeout_m=
s));
+
+	spin_lock_irqsave(&chip->cmd_lock, flags);
+	list_del(&cmd.list);
+	spin_unlock_irqrestore(&chip->cmd_lock, flags);
+
+	if (!ret) {
+		dev_err(&chip->pci->dev,
+			"command response timed out (channel=3D0x%02x code=3D0x%02x)\n",
+			channel, code);
+		return -ETIMEDOUT;
+	}
+	if (cmd.status)
+		return cmd.status;
+
+	if (cmd.response_code !=3D expected_rsp &&
+	    cmd.response_code !=3D TCI_RSP_STATUS) {
+		dev_err(&chip->pci->dev,
+			"unexpected response code 0x%02x (expected 0x%02x) for channel=3D0x%02x=
 code=3D0x%02x\n",
+			cmd.response_code, expected_rsp, channel, code);
+		return -EIO;
+	}
+
+	if (rx_data && rx_len && cmd.response_len) {
+		size_t copy =3D min(cmd.response_len, *rx_len);
+
+		memcpy(rx_data, cmd.response_data, copy);
+		*rx_len =3D copy;
+	}
+
+	return 0;
+}
+
+int quantum_tci_send_midi(struct quantum_chip *chip, const u8 *data, size_=
t len)
+{
+	struct tci_header *hdr;
+	u8 *payload;
+	u32 slot;
+	size_t total_len =3D sizeof(*hdr) + 4 + len;
+	int err =3D 0;
+
+	if (!len || len > 2048 || total_len > chip->cmd_msg_size)
+		return -EINVAL;
+	if (quantum_device_gone(chip) || !chip->tci_ready)
+		return -ENODEV;
+
+	mutex_lock(&chip->tci_tx_mutex);
+	if (quantum_device_gone(chip) || !chip->tci_ready) {
+		err =3D -ENODEV;
+		goto out_unlock;
+	}
+	err =3D quantum_get_tx_slot(chip, &slot);
+	if (err)
+		goto out_unlock;
+
+	hdr =3D chip->cmd_tx_slots[slot];
+	memset(hdr, 0, chip->cmd_msg_size);
+	hdr->length =3D cpu_to_le16(total_len);
+	hdr->channel =3D TCI_CHAN_MIDI_TX;
+	hdr->code =3D TCI_CMD_MIDI_TX;
+	hdr->tid =3D cpu_to_le16(chip->next_tid++);
+	payload =3D (u8 *)hdr + sizeof(*hdr);
+	payload[0] =3D 0;
+	payload[1] =3D 0;
+	*(__le16 *)(payload + 2) =3D cpu_to_le16(len);
+	memcpy(payload + 4, data, len);
+
+	/* Make coherent TX contents visible before ringing the doorbell. */
+	dma_wmb();
+	quantum_write32(chip, QUANTUM_REG_CMD_TX_LEN_BASE + slot * 4,
+			total_len);
+	quantum_inc_tx_sw_pos(chip, slot);
+
+out_unlock:
+	mutex_unlock(&chip->tci_tx_mutex);
+	return err;
+}
+
+/* Read the device serial number */
+
+int quantum_get_serial_number(struct quantum_chip *chip)
+{
+	u8 serial[32];
+	size_t len =3D sizeof(serial);
+	int ret;
+
+	ret =3D quantum_tci_send_wait(chip, TCI_CHAN_CTRL,
+				    TCI_CTRL_GET_SERIAL_NUMBER,
+				    TCI_CTRL_RSP_SERIAL_NUMBER,
+				    NULL, 0, serial, &len, 2000);
+	if (ret < 0)
+		return ret;
+
+	if (len > 0)
+		memcpy(chip->serial, serial, min(len, sizeof(chip->serial)));
+
+	quantum_tci_mark_ready(chip);
+	return 0;
+}
+
+/* Set the sample rate */
+
+int quantum_set_sample_rate(struct quantum_chip *chip, unsigned int rate)
+{
+	__le32 val =3D cpu_to_le32(rate);
+	int ret;
+
+	if (chip->tci_fatal_error)
+		return -EIO;
+
+	if (chip->sample_rate =3D=3D rate)
+		return 0;
+
+	ret =3D quantum_tci_send_wait(chip, TCI_CHAN_CTRL,
+				    TCI_CTRL_SET_SAMPLE_RATE,
+				    TCI_CTRL_RSP_SAMPLE_RATE,
+				    &val, sizeof(val), NULL, NULL, 1000);
+	if (ret < 0) {
+		dev_err(&chip->pci->dev, "Set sample rate failed: %d\n", ret);
+		return ret;
+	}
+
+	chip->sample_rate =3D rate;
+	dev_dbg(&chip->pci->dev, "sample rate set to %u Hz\n", rate);
+	return 0;
+}
+
+/* Set the clock source */
+
+int quantum_set_clock_source(struct quantum_chip *chip, unsigned int sourc=
e)
+{
+	__le32 val =3D cpu_to_le32(source + 1);
+	int ret;
+
+	if (chip->tci_fatal_error)
+		return -EIO;
+
+	if (source > CLK_SOURCE_EXTERNAL_ADAT2)
+		return -EINVAL;
+
+	ret =3D quantum_tci_send_wait(chip, TCI_CHAN_CTRL,
+				    TCI_CTRL_SET_CLOCK_SOURCE,
+				    TCI_CTRL_RSP_CLOCK_SOURCE,
+				    &val, sizeof(val), NULL, NULL, 1000);
+	if (ret < 0) {
+		dev_err(&chip->pci->dev, "Set clock source failed: %d\n", ret);
+		return ret;
+	}
+
+	chip->clock_source =3D source;
+	dev_dbg(&chip->pci->dev, "clock source set to %u\n", source);
+	return 0;
+}
+
+/* Read the clock source */
+
+int quantum_get_clock_source(struct quantum_chip *chip, unsigned int *sour=
ce)
+{
+	__le32 reply;
+	size_t len =3D sizeof(reply);
+	int ret;
+
+	if (chip->tci_fatal_error)
+		return -EIO;
+
+	ret =3D quantum_tci_send_wait(chip, TCI_CHAN_CTRL,
+				    TCI_CTRL_GET_CLOCK_SOURCE,
+				    TCI_CTRL_RSP_CLOCK_SOURCE,
+				    NULL, 0, &reply, &len, 1000);
+	if (ret < 0) {
+		dev_err(&chip->pci->dev, "Get clock source failed: %d\n", ret);
+		return ret;
+	}
+
+	if (len >=3D 4) {
+		u32 wire_source =3D le32_to_cpu(reply);
+
+		if (wire_source < 1 || wire_source > 5)
+			return -EIO;
+		*source =3D wire_source - 1;
+		chip->clock_source =3D *source;
+		dev_dbg(&chip->pci->dev, "clock source read as %u\n", *source);
+	}
+
+	return 0;
+}
--=20
2.50.1 (Apple Git-155)



