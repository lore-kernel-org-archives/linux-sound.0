Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E69419882C
	for <linux-sound@vger.kernel.org>; Wed,  2 Oct 2024 09:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.48.224.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727861978; cv=none; b=tkfdgg8wYRunvRY5e/sKmoaAGmuCOm6+coRchzo8UkxpA9uo3mptVljrwRQcVfVDG0Gasy4AbY+FOprZQNQB1Gu967iHgQk6c0P3EaK3ZAXYL0OW44MAtLSQZPkJ+8GDymwIHnrNOmSOdMtzlua0vRyHREv60S9QN8tdBA6xEYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727861978; c=relaxed/simple;
	bh=InhhlV6+Ji74H52B0Qg1MACQIDeZQRt7ljOFbbYHZfM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DOm4moq4TvWrluqDkc6VqQM8a/1J7rJKtWyk4m2hk6UWknpa3vBnYzKcOoryd3bvaGiWYfsXo07TIbSOjd9fazmUUvjekj7T8H2xujme5mm63nHs9B/p0qi3yBlvbTxIsXy47xQOg9zBn7Yc5do4hW3wCsS30T5qjCqDJ3WVFB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=perex.cz; spf=pass smtp.mailfrom=perex.cz; dkim=pass (1024-bit key) header.d=perex.cz header.i=@perex.cz header.b=WyIOYTpa; arc=none smtp.client-ip=77.48.224.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=perex.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perex.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=perex.cz header.i=@perex.cz header.b="WyIOYTpa"
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id A842E412F;
	Wed,  2 Oct 2024 11:39:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz A842E412F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1727861968; bh=551UTg3vTmKnei9YW1PEADsabZLbhOVSiWochVeHzGs=;
	h=From:To:Cc:Subject:Date:From;
	b=WyIOYTpawaN3FrD/kFf0dFB2XURY6eocNXK0/g1GPdIkn4vlrBb8JvgL4gwHKp/sD
	 F8ktHyoKGci170sybehNYn4Jihb76iul38TCdJSdtCbgVy2yBtOvoAY/rHuJh/ED+g
	 u6Inn864gZ/HM8aV9uURiE4weuav+qjxWPuBcJdk=
Received: from p1gen4.perex-int.cz (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Wed,  2 Oct 2024 11:39:19 +0200 (CEST)
From: Jaroslav Kysela <perex@perex.cz>
To: Linux Sound ML <linux-sound@vger.kernel.org>
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Mark Brown <broonie@kernel.org>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v6] ALSA: compress_offload: introduce accel operation mode
Date: Wed,  2 Oct 2024 11:39:04 +0200
Message-ID: <20241002093904.1809799-1-perex@perex.cz>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

There is a requirement to expose the audio hardware that accelerates various
tasks for user space such as sample rate converters, compressed
stream decoders, etc.

This is description for the API extension for the compress ALSA API which
is able to handle "tasks" that are not bound to real-time operations
and allows for the serialization of operations.

For details, refer to "compress-accel.rst" document.

Cc: Mark Brown <broonie@kernel.org>
Cc: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Jaroslav Kysela <perex@perex.cz>

---
v5..v6:
  - use list_for_each_entry_safe_reverse in snd_compr_task_free_all (thanks Shengjiu Wang)

v4..v5:
  - rename to passthrough_accel
  - fix bad indentation (compress_offload.h)
  - move runtime->tasks initialization (thanks Shengjiu Wang)
  - add documentation for internal struct snd_compr_task_runtime
  - add flags member to struct snd_compr_task (allow stream state reset
    without releasing the allocated buffers, future extesions)
  - add output_flags member to struct snd_compr_task_status (for future extensions)
  - add input_size member to struct snd_compr_task_status (thanks Pierre-Louis Bossart)
  - do free/stop operation for all tasks in reverse order

v3..v4:
  - resolved Takashi's requests:
    - make CONFIG_SND_COMPRESS_PASSTHROUGH as bool, remove wrong DMA_BUF selection
    - use EXPORT_SYMBOL_GPL for snd_compr_task_finished function
    - fix snd_compr_find_task indentation
  - add more CONFIG_SND_COMPRESS_PASSTHROUGH #if blocks

v2..v3:
  - fix missing runtime->tasks initialization (thanks Shengjiu Wang)
  - fix missing seqno initialization in task_new (thanks Shengjiu Wang)
  - fix reference counting for allocated dma buffers (thanks Shengjiu Wang)
  - use origin_seqno to reuse the already allocated buffers for new task

v1..v2:
  - fix some documentation typos (thanks Amadeusz Sławiński)
  - fix memdup_user() error handling (thanks Takashi)
  - use one state variable instead multiple (thanks Takashi)
  - handle task limit (set to 64 - mentioned in documentation, NIY)
  - fix file release (free all tasks)
---
 .../sound/designs/compress-accel.rst          | 134 +++++++
 include/sound/compress_driver.h               |  46 +++
 include/uapi/sound/compress_offload.h         |  64 +++-
 sound/core/Kconfig                            |   3 +
 sound/core/compress_offload.c                 | 348 +++++++++++++++++-
 5 files changed, 587 insertions(+), 8 deletions(-)
 create mode 100644 Documentation/sound/designs/compress-accel.rst

diff --git a/Documentation/sound/designs/compress-accel.rst b/Documentation/sound/designs/compress-accel.rst
new file mode 100644
index 000000000000..abf1f76a8778
--- /dev/null
+++ b/Documentation/sound/designs/compress-accel.rst
@@ -0,0 +1,134 @@
+==================================
+ALSA Co-processor Acceleration API
+==================================
+
+Jaroslav Kysela <perex@perex.cz>
+
+
+Overview
+========
+
+There is a requirement to expose the audio hardware that accelerates various
+tasks for user space such as sample rate converters, compressed
+stream decoders, etc.
+
+This is description for the API extension for the compress ALSA API which
+is able to handle "tasks" that are not bound to real-time operations
+and allows for the serialization of operations.
+
+Requirements
+============
+
+The main requirements are:
+
+- serialization of multiple tasks for user space to allow multiple
+  operations without user space intervention
+
+- separate buffers (input + output) for each operation
+
+- expose buffers using mmap to user space
+
+- signal user space when the task is finished (standard poll mechanism)
+
+Design
+======
+
+A new direction SND_COMPRESS_ACCEL is introduced to identify
+the passthrough API.
+
+The API extension shares device enumeration and parameters handling from
+the main compressed API. All other realtime streaming ioctls are deactivated
+and a new set of task related ioctls are introduced. The standard
+read/write/mmap I/O operations are not supported in the passthrough device.
+
+Device ("stream") state handling is reduced to OPEN/SETUP. All other
+states are not available for the passthrough mode.
+
+Data I/O mechanism is using standard dma-buf interface with all advantages
+like mmap, standard I/O, buffer sharing etc. One buffer is used for the
+input data and second (separate) buffer is used for the output data. Each task
+have separate I/O buffers.
+
+For the buffering parameters, the fragments means a limit of allocated tasks
+for given device. The fragment_size limits the input buffer size for the given
+device. The output buffer size is determined by the driver (may be different
+from the input buffer size).
+
+State Machine
+=============
+
+The passthrough audio stream state machine is described below :
+
+                                       +----------+
+                                       |          |
+                                       |   OPEN   |
+                                       |          |
+                                       +----------+
+                                             |
+                                             |
+                                             | compr_set_params()
+                                             |
+                                             v
+         all passthrough task ops      +----------+
+  +------------------------------------|          |
+  |                                    |   SETUP  |
+  |                                    |
+  |                                    +----------+
+  |                                          |
+  +------------------------------------------+
+
+
+Passthrough operations (ioctls)
+===============================
+
+All operations are protected using stream->device->lock (mutex).
+
+CREATE
+------
+Creates a set of input/output buffers. The input buffer size is
+fragment_size. Allocates unique seqno.
+
+The hardware drivers allocate internal 'struct dma_buf' for both input and
+output buffers (using 'dma_buf_export()' function). The anonymous
+file descriptors for those buffers are passed to user space.
+
+FREE
+----
+Free a set of input/output buffers. If a task is active, the stop
+operation is executed before. If seqno is zero, operation is executed for all
+tasks.
+
+START
+-----
+Starts (queues) a task. There are two cases of the task start - right after
+the task is created. In this case, origin_seqno must be zero.
+The second case is for reusing of already finished task. The origin_seqno
+must identify the task to be reused. In both cases, a new seqno value
+is allocated and returned to user space.
+
+The prerequisite is that application filled input dma buffer with
+new source data and set input_size to pass the real data size to the driver.
+
+The order of data processing is preserved (first started job must be
+finished at first).
+
+If the multiple tasks require a state handling (e.g. resampling operation),
+the user space may set SND_COMPRESS_TFLG_NEW_STREAM flag to mark the
+start of the new stream data. It is useful to keep the allocated buffers
+for the new operation rather using open/close mechanism.
+
+STOP
+----
+Stop (dequeues) a task. If seqno is zero, operation is executed for all
+tasks.
+
+STATUS
+------
+Obtain the task status (active, finished). Also, the driver will set
+the real output data size (valid area in the output buffer).
+
+Credits
+=======
+- Shengjiu Wang <shengjiu.wang@gmail.com>
+- Takashi Iwai <tiwai@suse.de>
+- Vinod Koul <vkoul@kernel.org>
diff --git a/include/sound/compress_driver.h b/include/sound/compress_driver.h
index bcf872c17dd3..5db4881b0681 100644
--- a/include/sound/compress_driver.h
+++ b/include/sound/compress_driver.h
@@ -19,6 +19,30 @@
 
 struct snd_compr_ops;
 
+/**
+ * struct snd_compr_task_runtime: task runtime description
+ * @list: list of all managed tasks
+ * @input: input DMA buffer
+ * @output: output DMA buffer
+ * @seqno: sequence number
+ * @input_size: really used data in the input buffer
+ * @output_size: really used data in the output buffer
+ * @flags: see SND_COMPRESS_TFLG_*
+ * @state: actual task state
+ * @private_value: used by the lowlevel driver (opaque)
+ */
+struct snd_compr_task_runtime {
+	struct list_head list;
+	struct dma_buf *input;
+	struct dma_buf *output;
+	u64 seqno;
+	u64 input_size;
+	u64 output_size;
+	u32 flags;
+	u8 state;
+	void *private_value;
+};
+
 /**
  * struct snd_compr_runtime: runtime stream description
  * @state: stream state
@@ -37,6 +61,10 @@ struct snd_compr_ops;
  * @dma_addr: physical buffer address (not accessible from main CPU)
  * @dma_bytes: size of DMA area
  * @dma_buffer_p: runtime dma buffer pointer
+ * @active_tasks: count of active tasks
+ * @total_tasks: count of all tasks
+ * @task_seqno: last task sequence number (!= 0)
+ * @tasks: list of all tasks
  */
 struct snd_compr_runtime {
 	snd_pcm_state_t state;
@@ -54,6 +82,13 @@ struct snd_compr_runtime {
 	dma_addr_t dma_addr;
 	size_t dma_bytes;
 	struct snd_dma_buffer *dma_buffer_p;
+
+#if IS_ENABLED(CONFIG_SND_COMPRESS_ACCEL)
+	u32 active_tasks;
+	u32 total_tasks;
+	u64 task_seqno;
+	struct list_head tasks;
+#endif
 };
 
 /**
@@ -132,6 +167,12 @@ struct snd_compr_ops {
 			struct snd_compr_caps *caps);
 	int (*get_codec_caps) (struct snd_compr_stream *stream,
 			struct snd_compr_codec_caps *codec);
+#if IS_ENABLED(CONFIG_SND_COMPRESS_ACCEL)
+	int (*task_create) (struct snd_compr_stream *stream, struct snd_compr_task_runtime *task);
+	int (*task_start) (struct snd_compr_stream *stream, struct snd_compr_task_runtime *task);
+	int (*task_stop) (struct snd_compr_stream *stream, struct snd_compr_task_runtime *task);
+	int (*task_free) (struct snd_compr_stream *stream, struct snd_compr_task_runtime *task);
+#endif
 };
 
 /**
@@ -242,4 +283,9 @@ int snd_compr_free_pages(struct snd_compr_stream *stream);
 int snd_compr_stop_error(struct snd_compr_stream *stream,
 			 snd_pcm_state_t state);
 
+#if IS_ENABLED(CONFIG_SND_COMPRESS_ACCEL)
+void snd_compr_task_finished(struct snd_compr_stream *stream,
+			     struct snd_compr_task_runtime *task);
+#endif
+
 #endif
diff --git a/include/uapi/sound/compress_offload.h b/include/uapi/sound/compress_offload.h
index d185957f3fe0..98772b0cbcb7 100644
--- a/include/uapi/sound/compress_offload.h
+++ b/include/uapi/sound/compress_offload.h
@@ -14,7 +14,7 @@
 #include <sound/compress_params.h>
 
 
-#define SNDRV_COMPRESS_VERSION SNDRV_PROTOCOL_VERSION(0, 2, 0)
+#define SNDRV_COMPRESS_VERSION SNDRV_PROTOCOL_VERSION(0, 3, 0)
 /**
  * struct snd_compressed_buffer - compressed buffer
  * @fragment_size: size of buffer fragment in bytes
@@ -68,7 +68,8 @@ struct snd_compr_avail {
 
 enum snd_compr_direction {
 	SND_COMPRESS_PLAYBACK = 0,
-	SND_COMPRESS_CAPTURE
+	SND_COMPRESS_CAPTURE,
+	SND_COMPRESS_ACCEL
 };
 
 /**
@@ -127,6 +128,57 @@ struct snd_compr_metadata {
 	 __u32 value[8];
 } __attribute__((packed, aligned(4)));
 
+/* flags for struct snd_compr_task */
+#define SND_COMPRESS_TFLG_NEW_STREAM		(1<<0)	/* mark for the new stream data */
+
+/**
+ * struct snd_compr_task - task primitive for non-realtime operation
+ * @seqno: sequence number (task identifier)
+ * @origin_seqno: previous sequence number (task identifier) - for reuse
+ * @input_fd: data input file descriptor (dma-buf)
+ * @output_fd: data output file descriptor (dma-buf)
+ * @input_size: filled data in bytes (from caller, must not exceed fragment size)
+ * @flags: see SND_COMPRESS_TFLG_* defines
+ */
+struct snd_compr_task {
+	__u64 seqno;
+	__u64 origin_seqno;
+	int input_fd;
+	int output_fd;
+	__u64 input_size;
+	__u32 flags;
+	__u8 reserved[16];
+} __attribute__((packed, aligned(4)));
+
+/**
+ * enum snd_compr_state - task state
+ * @SND_COMPRESS_TASK_STATE_IDLE: task is not queued
+ * @SND_COMPRESS_TASK_STATE_ACTIVE: task is in the queue
+ * @SND_COMPRESS_TASK_STATE_FINISHED: task was processed, output is available
+ */
+enum snd_compr_state {
+	SND_COMPRESS_TASK_STATE_IDLE = 0,
+	SND_COMPRESS_TASK_STATE_ACTIVE,
+	SND_COMPRESS_TASK_STATE_FINISHED
+};
+
+/**
+ * struct snd_compr_task_status - task status
+ * @seqno: sequence number (task identifier)
+ * @input_size: filled data in bytes (from user space)
+ * @output_size: filled data in bytes (from driver)
+ * @output_flags: reserved for future (all zeros - from driver)
+ * @state: actual task state (SND_COMPRESS_TASK_STATE_*)
+ */
+struct snd_compr_task_status {
+	__u64 seqno;
+	__u64 input_size;
+	__u64 output_size;
+	__u32 output_flags;
+	__u8 state;
+	__u8 reserved[15];
+} __attribute__((packed, aligned(4)));
+
 /*
  * compress path ioctl definitions
  * SNDRV_COMPRESS_GET_CAPS: Query capability of DSP
@@ -164,6 +216,14 @@ struct snd_compr_metadata {
 #define SNDRV_COMPRESS_DRAIN		_IO('C', 0x34)
 #define SNDRV_COMPRESS_NEXT_TRACK	_IO('C', 0x35)
 #define SNDRV_COMPRESS_PARTIAL_DRAIN	_IO('C', 0x36)
+
+
+#define SNDRV_COMPRESS_TASK_CREATE	_IOWR('C', 0x60, struct snd_compr_task)
+#define SNDRV_COMPRESS_TASK_FREE	_IOW('C', 0x61, __u64)
+#define SNDRV_COMPRESS_TASK_START	_IOWR('C', 0x62, struct snd_compr_task)
+#define SNDRV_COMPRESS_TASK_STOP	_IOW('C', 0x63, __u64)
+#define SNDRV_COMPRESS_TASK_STATUS	_IOWR('C', 0x68, struct snd_compr_task_status)
+
 /*
  * TODO
  * 1. add mmap support
diff --git a/sound/core/Kconfig b/sound/core/Kconfig
index 2c5b9f964703..48db44fa56fe 100644
--- a/sound/core/Kconfig
+++ b/sound/core/Kconfig
@@ -59,6 +59,9 @@ config SND_CORE_TEST
 config SND_COMPRESS_OFFLOAD
 	tristate
 
+config SND_COMPRESS_ACCEL
+	bool
+
 config SND_JACK
 	bool
 
diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
index b8c0d6edbdd1..901d433c817c 100644
--- a/sound/core/compress_offload.c
+++ b/sound/core/compress_offload.c
@@ -24,6 +24,7 @@
 #include <linux/types.h>
 #include <linux/uio.h>
 #include <linux/uaccess.h>
+#include <linux/dma-buf.h>
 #include <linux/module.h>
 #include <linux/compat.h>
 #include <sound/core.h>
@@ -54,6 +55,12 @@ struct snd_compr_file {
 
 static void error_delayed_work(struct work_struct *work);
 
+#if IS_ENABLED(CONFIG_SND_COMPRESS_ACCEL)
+static void snd_compr_task_free_all(struct snd_compr_stream *stream);
+#else
+static inline void snd_compr_task_free_all(struct snd_compr_stream *stream) { }
+#endif
+
 /*
  * a note on stream states used:
  * we use following states in the compressed core
@@ -85,6 +92,8 @@ static int snd_compr_open(struct inode *inode, struct file *f)
 		dirn = SND_COMPRESS_PLAYBACK;
 	else if ((f->f_flags & O_ACCMODE) == O_RDONLY)
 		dirn = SND_COMPRESS_CAPTURE;
+	else if ((f->f_flags & O_ACCMODE) == O_RDWR)
+		dirn = SND_COMPRESS_ACCEL;
 	else
 		return -EINVAL;
 
@@ -125,6 +134,9 @@ static int snd_compr_open(struct inode *inode, struct file *f)
 	}
 	runtime->state = SNDRV_PCM_STATE_OPEN;
 	init_waitqueue_head(&runtime->sleep);
+#if IS_ENABLED(CONFIG_SND_COMPRESS_ACCEL)
+	INIT_LIST_HEAD(&runtime->tasks);
+#endif
 	data->stream.runtime = runtime;
 	f->private_data = (void *)data;
 	scoped_guard(mutex, &compr->lock)
@@ -154,6 +166,8 @@ static int snd_compr_free(struct inode *inode, struct file *f)
 		break;
 	}
 
+	snd_compr_task_free_all(&data->stream);
+
 	data->stream.ops->free(&data->stream);
 	if (!data->stream.runtime->dma_buffer_p)
 		kfree(data->stream.runtime->buffer);
@@ -226,6 +240,9 @@ snd_compr_ioctl_avail(struct snd_compr_stream *stream, unsigned long arg)
 	struct snd_compr_avail ioctl_avail;
 	size_t avail;
 
+	if (stream->direction == SND_COMPRESS_ACCEL)
+		return -EBADFD;
+
 	avail = snd_compr_calc_avail(stream, &ioctl_avail);
 	ioctl_avail.avail = avail;
 
@@ -287,6 +304,8 @@ static ssize_t snd_compr_write(struct file *f, const char __user *buf,
 		return -EFAULT;
 
 	stream = &data->stream;
+	if (stream->direction == SND_COMPRESS_ACCEL)
+		return -EBADFD;
 	guard(mutex)(&stream->device->lock);
 	/* write is allowed when stream is running or has been steup */
 	switch (stream->runtime->state) {
@@ -336,6 +355,8 @@ static ssize_t snd_compr_read(struct file *f, char __user *buf,
 		return -EFAULT;
 
 	stream = &data->stream;
+	if (stream->direction == SND_COMPRESS_ACCEL)
+		return -EBADFD;
 	guard(mutex)(&stream->device->lock);
 
 	/* read is allowed when stream is running, paused, draining and setup
@@ -385,6 +406,7 @@ static __poll_t snd_compr_poll(struct file *f, poll_table *wait)
 {
 	struct snd_compr_file *data = f->private_data;
 	struct snd_compr_stream *stream;
+	struct snd_compr_runtime *runtime;
 	size_t avail;
 	__poll_t retval = 0;
 
@@ -392,6 +414,7 @@ static __poll_t snd_compr_poll(struct file *f, poll_table *wait)
 		return EPOLLERR;
 
 	stream = &data->stream;
+	runtime = stream->runtime;
 
 	guard(mutex)(&stream->device->lock);
 
@@ -405,6 +428,20 @@ static __poll_t snd_compr_poll(struct file *f, poll_table *wait)
 
 	poll_wait(f, &stream->runtime->sleep, wait);
 
+#if IS_ENABLED(CONFIG_SND_COMPRESS_ACCEL)
+	if (stream->direction == SND_COMPRESS_ACCEL) {
+		struct snd_compr_task_runtime *task;
+		if (runtime->fragments > runtime->active_tasks)
+			retval |= EPOLLOUT | EPOLLWRNORM;
+		task = list_first_entry_or_null(&runtime->tasks,
+						struct snd_compr_task_runtime,
+						list);
+		if (task && task->state == SND_COMPRESS_TASK_STATE_FINISHED)
+			retval |= EPOLLIN | EPOLLRDNORM;
+		return retval;
+	}
+#endif
+
 	avail = snd_compr_get_avail(stream);
 	pr_debug("avail is %ld\n", (unsigned long)avail);
 	/* check if we have at least one fragment to fill */
@@ -521,6 +558,9 @@ static int snd_compr_allocate_buffer(struct snd_compr_stream *stream,
 	unsigned int buffer_size;
 	void *buffer = NULL;
 
+	if (stream->direction == SND_COMPRESS_ACCEL)
+		goto params;
+
 	buffer_size = params->buffer.fragment_size * params->buffer.fragments;
 	if (stream->ops->copy) {
 		buffer = NULL;
@@ -543,18 +583,30 @@ static int snd_compr_allocate_buffer(struct snd_compr_stream *stream,
 		if (!buffer)
 			return -ENOMEM;
 	}
-	stream->runtime->fragment_size = params->buffer.fragment_size;
-	stream->runtime->fragments = params->buffer.fragments;
+
 	stream->runtime->buffer = buffer;
 	stream->runtime->buffer_size = buffer_size;
+params:
+	stream->runtime->fragment_size = params->buffer.fragment_size;
+	stream->runtime->fragments = params->buffer.fragments;
 	return 0;
 }
 
-static int snd_compress_check_input(struct snd_compr_params *params)
+static int
+snd_compress_check_input(struct snd_compr_stream *stream, struct snd_compr_params *params)
 {
+	u32 max_fragments;
+
 	/* first let's check the buffer parameter's */
-	if (params->buffer.fragment_size == 0 ||
-	    params->buffer.fragments > U32_MAX / params->buffer.fragment_size ||
+	if (params->buffer.fragment_size == 0)
+		return -EINVAL;
+
+	if (stream->direction == SND_COMPRESS_ACCEL)
+		max_fragments = 64;			/* safe value */
+	else
+		max_fragments = U32_MAX / params->buffer.fragment_size;
+
+	if (params->buffer.fragments > max_fragments ||
 	    params->buffer.fragments == 0)
 		return -EINVAL;
 
@@ -583,7 +635,7 @@ snd_compr_set_params(struct snd_compr_stream *stream, unsigned long arg)
 		if (IS_ERR(params))
 			return PTR_ERR(params);
 
-		retval = snd_compress_check_input(params);
+		retval = snd_compress_check_input(stream, params);
 		if (retval)
 			return retval;
 
@@ -939,6 +991,264 @@ static int snd_compr_partial_drain(struct snd_compr_stream *stream)
 	return snd_compress_wait_for_drain(stream);
 }
 
+#if IS_ENABLED(CONFIG_SND_COMPRESS_ACCEL)
+
+static struct snd_compr_task_runtime *
+snd_compr_find_task(struct snd_compr_stream *stream, __u64 seqno)
+{
+	struct snd_compr_task_runtime *task;
+
+	list_for_each_entry(task, &stream->runtime->tasks, list) {
+		if (task->seqno == seqno)
+			return task;
+	}
+	return NULL;
+}
+
+static void snd_compr_task_free(struct snd_compr_task_runtime *task)
+{
+	if (task->output)
+		dma_buf_put(task->output);
+	if (task->input)
+		dma_buf_put(task->input);
+	kfree(task);
+}
+
+static u64 snd_compr_seqno_next(struct snd_compr_stream *stream)
+{
+	u64 seqno = ++stream->runtime->task_seqno;
+	if (seqno == 0)
+		seqno = ++stream->runtime->task_seqno;
+	return seqno;
+}
+
+static int snd_compr_task_new(struct snd_compr_stream *stream, struct snd_compr_task *utask)
+{
+	struct snd_compr_task_runtime *task;
+	int retval;
+
+	if (stream->runtime->total_tasks >= stream->runtime->fragments)
+		return -EBUSY;
+	if (utask->origin_seqno != 0 || utask->input_size != 0)
+		return -EINVAL;
+	task = kzalloc(sizeof(*task), GFP_KERNEL);
+	if (task == NULL)
+		return -ENOMEM;
+	task->seqno = utask->seqno = snd_compr_seqno_next(stream);
+	task->input_size = utask->input_size;
+	retval = stream->ops->task_create(stream, task);
+	if (retval < 0)
+		goto cleanup;
+	utask->input_fd = dma_buf_fd(task->input, O_WRONLY|O_CLOEXEC);
+	if (utask->input_fd < 0) {
+		retval = utask->input_fd;
+		goto cleanup;
+	}
+	utask->output_fd = dma_buf_fd(task->output, O_RDONLY|O_CLOEXEC);
+	if (utask->output_fd < 0) {
+		retval = utask->output_fd;
+		goto cleanup;
+	}
+	/* keep dmabuf reference until freed with task free ioctl */
+	dma_buf_get(utask->input_fd);
+	dma_buf_get(utask->output_fd);
+	list_add_tail(&task->list, &stream->runtime->tasks);
+	stream->runtime->total_tasks++;
+	return 0;
+cleanup:
+	snd_compr_task_free(task);
+	return retval;
+}
+
+static int snd_compr_task_create(struct snd_compr_stream *stream, unsigned long arg)
+{
+	struct snd_compr_task *task __free(kfree) = NULL;
+	int retval;
+
+	if (stream->runtime->state != SNDRV_PCM_STATE_SETUP)
+		return -EPERM;
+	task = memdup_user((void __user *)arg, sizeof(*task));
+	if (IS_ERR(task))
+		return PTR_ERR(no_free_ptr(task));
+	retval = snd_compr_task_new(stream, task);
+	if (retval >= 0)
+		if (copy_to_user((void __user *)arg, task, sizeof(*task)))
+			retval = -EFAULT;
+	return retval;
+}
+
+static int snd_compr_task_start_prepare(struct snd_compr_task_runtime *task,
+					struct snd_compr_task *utask)
+{
+	if (task == NULL)
+		return -EINVAL;
+	if (task->state >= SND_COMPRESS_TASK_STATE_FINISHED)
+		return -EBUSY;
+	if (utask->input_size > task->input->size)
+		return -EINVAL;
+	task->flags = utask->flags;
+	task->input_size = utask->input_size;
+	task->state = SND_COMPRESS_TASK_STATE_IDLE;
+	return 0;
+}
+
+static int snd_compr_task_start(struct snd_compr_stream *stream, struct snd_compr_task *utask)
+{
+	struct snd_compr_task_runtime *task;
+	int retval;
+
+	if (utask->origin_seqno > 0) {
+		task = snd_compr_find_task(stream, utask->origin_seqno);
+		retval = snd_compr_task_start_prepare(task, utask);
+		if (retval < 0)
+			return retval;
+		task->seqno = utask->seqno = snd_compr_seqno_next(stream);
+		utask->origin_seqno = 0;
+		list_move_tail(&task->list, &stream->runtime->tasks);
+	} else {
+		task = snd_compr_find_task(stream, utask->seqno);
+		if (task && task->state != SND_COMPRESS_TASK_STATE_IDLE)
+			return -EBUSY;
+		retval = snd_compr_task_start_prepare(task, utask);
+		if (retval < 0)
+			return retval;
+	}
+	retval = stream->ops->task_start(stream, task);
+	if (retval >= 0) {
+		task->state = SND_COMPRESS_TASK_STATE_ACTIVE;
+		stream->runtime->active_tasks++;
+	}
+	return retval;
+}
+
+static int snd_compr_task_start_ioctl(struct snd_compr_stream *stream, unsigned long arg)
+{
+	struct snd_compr_task *task __free(kfree) = NULL;
+	int retval;
+
+	if (stream->runtime->state != SNDRV_PCM_STATE_SETUP)
+		return -EPERM;
+	task = memdup_user((void __user *)arg, sizeof(*task));
+	if (IS_ERR(task))
+		return PTR_ERR(no_free_ptr(task));
+	retval = snd_compr_task_start(stream, task);
+	if (retval >= 0)
+		if (copy_to_user((void __user *)arg, task, sizeof(*task)))
+			retval = -EFAULT;
+	return retval;
+}
+
+static void snd_compr_task_stop_one(struct snd_compr_stream *stream,
+					struct snd_compr_task_runtime *task)
+{
+	if (task->state != SND_COMPRESS_TASK_STATE_ACTIVE)
+		return;
+	stream->ops->task_stop(stream, task);
+	if (!snd_BUG_ON(stream->runtime->active_tasks == 0))
+		stream->runtime->active_tasks--;
+	list_move_tail(&task->list, &stream->runtime->tasks);
+	task->state = SND_COMPRESS_TASK_STATE_IDLE;
+}
+
+static void snd_compr_task_free_one(struct snd_compr_stream *stream,
+					struct snd_compr_task_runtime *task)
+{
+	snd_compr_task_stop_one(stream, task);
+	stream->ops->task_free(stream, task);
+	list_del(&task->list);
+	snd_compr_task_free(task);
+	stream->runtime->total_tasks--;
+}
+
+static void snd_compr_task_free_all(struct snd_compr_stream *stream)
+{
+	struct snd_compr_task_runtime *task, *temp;
+
+	list_for_each_entry_safe_reverse(task, temp, &stream->runtime->tasks, list)
+		snd_compr_task_free_one(stream, task);
+}
+
+typedef void (*snd_compr_seq_func_t)(struct snd_compr_stream *stream,
+					struct snd_compr_task_runtime *task);
+
+static int snd_compr_task_seq(struct snd_compr_stream *stream, unsigned long arg,
+					snd_compr_seq_func_t fcn)
+{
+	struct snd_compr_task_runtime *task;
+	__u64 seqno;
+	int retval;
+
+	if (stream->runtime->state != SNDRV_PCM_STATE_SETUP)
+		return -EPERM;
+	retval = get_user(seqno, (__u64 __user *)arg);
+	if (retval < 0)
+		return retval;
+	retval = 0;
+	if (seqno == 0) {
+		list_for_each_entry_reverse(task, &stream->runtime->tasks, list)
+			fcn(stream, task);
+	} else {
+		task = snd_compr_find_task(stream, seqno);
+		if (task == NULL) {
+			retval = -EINVAL;
+		} else {
+			fcn(stream, task);
+		}
+	}
+	return retval;
+}
+
+static int snd_compr_task_status(struct snd_compr_stream *stream,
+					struct snd_compr_task_status *status)
+{
+	struct snd_compr_task_runtime *task;
+
+	task = snd_compr_find_task(stream, status->seqno);
+	if (task == NULL)
+		return -EINVAL;
+	status->input_size = task->input_size;
+	status->output_size = task->output_size;
+	status->state = task->state;
+	return 0;
+}
+
+static int snd_compr_task_status_ioctl(struct snd_compr_stream *stream, unsigned long arg)
+{
+	struct snd_compr_task_status *status __free(kfree) = NULL;
+	int retval;
+
+	if (stream->runtime->state != SNDRV_PCM_STATE_SETUP)
+		return -EPERM;
+	status = memdup_user((void __user *)arg, sizeof(*status));
+	if (IS_ERR(status))
+		return PTR_ERR(no_free_ptr(status));
+	retval = snd_compr_task_status(stream, status);
+	if (retval >= 0)
+		if (copy_to_user((void __user *)arg, status, sizeof(*status)))
+			retval = -EFAULT;
+	return retval;
+}
+
+/**
+ * snd_compr_task_finished: Notify that the task was finished
+ * @stream: pointer to stream
+ * @task: runtime task structure
+ *
+ * Set the finished task state and notify waiters.
+ */
+void snd_compr_task_finished(struct snd_compr_stream *stream,
+			    struct snd_compr_task_runtime *task)
+{
+	guard(mutex)(&stream->device->lock);
+	if (!snd_BUG_ON(stream->runtime->active_tasks == 0))
+		stream->runtime->active_tasks--;
+	task->state = SND_COMPRESS_TASK_STATE_FINISHED;
+	wake_up(&stream->runtime->sleep);
+}
+EXPORT_SYMBOL_GPL(snd_compr_task_finished);
+
+#endif /* CONFIG_SND_COMPRESS_ACCEL */
+
 static long snd_compr_ioctl(struct file *f, unsigned int cmd, unsigned long arg)
 {
 	struct snd_compr_file *data = f->private_data;
@@ -968,6 +1278,27 @@ static long snd_compr_ioctl(struct file *f, unsigned int cmd, unsigned long arg)
 		return snd_compr_set_metadata(stream, arg);
 	case _IOC_NR(SNDRV_COMPRESS_GET_METADATA):
 		return snd_compr_get_metadata(stream, arg);
+	}
+
+	if (stream->direction == SND_COMPRESS_ACCEL) {
+#if IS_ENABLED(CONFIG_SND_COMPRESS_ACCEL)
+		switch (_IOC_NR(cmd)) {
+		case _IOC_NR(SNDRV_COMPRESS_TASK_CREATE):
+			return snd_compr_task_create(stream, arg);
+		case _IOC_NR(SNDRV_COMPRESS_TASK_FREE):
+			return snd_compr_task_seq(stream, arg, snd_compr_task_free_one);
+		case _IOC_NR(SNDRV_COMPRESS_TASK_START):
+			return snd_compr_task_start_ioctl(stream, arg);
+		case _IOC_NR(SNDRV_COMPRESS_TASK_STOP):
+			return snd_compr_task_seq(stream, arg, snd_compr_task_stop_one);
+		case _IOC_NR(SNDRV_COMPRESS_TASK_STATUS):
+			return snd_compr_task_status_ioctl(stream, arg);
+		}
+#endif
+		return -ENOTTY;
+	}
+
+	switch (_IOC_NR(cmd)) {
 	case _IOC_NR(SNDRV_COMPRESS_TSTAMP):
 		return snd_compr_tstamp(stream, arg);
 	case _IOC_NR(SNDRV_COMPRESS_AVAIL):
@@ -1140,6 +1471,11 @@ int snd_compress_new(struct snd_card *card, int device,
 	};
 	int ret;
 
+#if !IS_ENABLED(CONFIG_SND_COMPRESS_ACCEL)
+	if (snd_BUG_ON(dirn == SND_COMPRESS_ACCEL))
+		return -EINVAL;
+#endif
+
 	compr->card = card;
 	compr->device = device;
 	compr->direction = dirn;
-- 
2.46.0

