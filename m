Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB1518044
	for <linux-sound@vger.kernel.org>; Mon, 27 May 2024 07:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.48.224.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716794483; cv=none; b=F/Op3i7WMQ/CCi8dGS81cTqUYRsnjphWc0j1nLc1GFvlBpQUBB99N7V4oWs2IGI43p0FIaNaDxhThhQimEpZsAUBgAXN+rspJy+3BRiIbW6I8pRkFz9OKOqoy3Dg0GXGUZEdcojeEaXzQ8Vl4aWZC8rjpbIACEuOdkEehUllc84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716794483; c=relaxed/simple;
	bh=1Bhm0nH+1feVb3YRbED0thvjea4Wt/UYdQ7JBhQbMeQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ub/BDjT4zugQco0gWKEkQIU8REfcAk/3ve4GtfpcvAYtbO6PZ6Mop6wFtZD3Shg0gfeNnEXa723zcxsK/9t0Dr+VTy9AbrR/qZbG5eu/UVRFwK5mzOywCgVId9o0QeePVmdAaUysVm8ZGUofC22cYvBgG+QrKfZcMxmJk/pVU2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=perex.cz; spf=pass smtp.mailfrom=perex.cz; dkim=pass (1024-bit key) header.d=perex.cz header.i=@perex.cz header.b=GH3A3x+u; arc=none smtp.client-ip=77.48.224.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=perex.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perex.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=perex.cz header.i=@perex.cz header.b="GH3A3x+u"
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 47A814B93;
	Mon, 27 May 2024 09:11:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 47A814B93
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1716793908; bh=I+cqvAdn9s8XFYhdohpMGZAp8lDxUmZEYSAJgQPNC44=;
	h=From:To:Cc:Subject:Date:From;
	b=GH3A3x+unYmIJVKKswjkUmXFLJWiGmIxkE2Dhy7w+ttq62wIssqDwAlzVfIoi/XD7
	 9uwZ/gBhdqXh4gagxj9R/Oue/RP6z+hBYYgDxaEAY+Ey3jJ7+Elx2s5642x5Xn5en2
	 uLns4x9NJLgl6CoH4N3w1Qgf6esh4C877Gi3krJ8=
Received: from p1gen4.perex-int.cz (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Mon, 27 May 2024 09:11:39 +0200 (CEST)
From: Jaroslav Kysela <perex@perex.cz>
To:  <linux-sound@vger.kernel.org>
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Mark Brown <broonie@kernel.org>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Vinod Koul <vkoul@kernel.org>
Subject: [RFC PATCH] ALSA: compress_offload: introduce passthrough operation mode
Date: Mon, 27 May 2024 09:11:33 +0200
Message-ID: <20240527071133.223066-1-perex@perex.cz>
X-Mailer: git-send-email 2.45.1
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

For details, refer to "compress-passthrough.rst" document.

Note: This code is RFC (not tested, just to clearify the API requirements).
My goal is to add a test (loopback) driver and add a support to tinycompress
library in the next step.

Cc: Mark Brown <broonie@kernel.org>
Cc: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Jaroslav Kysela <perex@perex.cz>
---
 .../sound/designs/compress-passthrough.rst    | 125 +++++++
 include/sound/compress_driver.h               |  32 ++
 include/uapi/sound/compress_offload.h         |  44 ++-
 sound/core/Kconfig                            |   4 +
 sound/core/compress_offload.c                 | 314 +++++++++++++++++-
 5 files changed, 511 insertions(+), 8 deletions(-)
 create mode 100644 Documentation/sound/designs/compress-passthrough.rst

diff --git a/Documentation/sound/designs/compress-passthrough.rst b/Documentation/sound/designs/compress-passthrough.rst
new file mode 100644
index 000000000000..bb5a0ae5c496
--- /dev/null
+++ b/Documentation/sound/designs/compress-passthrough.rst
@@ -0,0 +1,125 @@
+=================================
+ALSA Co-processor Passthrough API
+=================================
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
+A new direction SND_COMPRESS_PASSTHROUGH is introduced to identify
+the passthrough API.
+
+The API extension shares device enumeration and parameters handling from
+the main compressed API. All other realtime streaming ioctls are deactivated
+and a new set of task related ioctls are introduced. The standard
+read/write/mmap I/O operations are not supported in the passtrough device.
+
+Device ("stream") state handling is reduced to OPEN/SETUP. All other
+states are not available for the passthrough mode.
+
+Data I/O mechanism is using standard dma-buf interface with all advantages
+like mmap, standard I/O, buffer sharing etc. One buffer is used for the
+input data and second (separate) buffer is used for the ouput data. Each task
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
+The passtrough audio stream state machine is described below :
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
+Free a set of input/output buffers. If an task is active, the stop
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
+- ...
diff --git a/include/sound/compress_driver.h b/include/sound/compress_driver.h
index bcf872c17dd3..acfe79dd43f9 100644
--- a/include/sound/compress_driver.h
+++ b/include/sound/compress_driver.h
@@ -19,6 +19,23 @@
 
 struct snd_compr_ops;
 
+/**
+ * struct snd_compr_task_runtime: task runtime description
+ *
+ */
+struct snd_compr_task_runtime {
+	struct list_head list;
+	struct dma_buf *input;
+	struct dma_buf *output;
+	__u64 seqno;
+	__u64 input_size;
+	__u64 output_size;
+	bool active;
+	bool finished;
+	void *private_value;
+};
+
+
 /**
  * struct snd_compr_runtime: runtime stream description
  * @state: stream state
@@ -54,6 +71,10 @@ struct snd_compr_runtime {
 	dma_addr_t dma_addr;
 	size_t dma_bytes;
 	struct snd_dma_buffer *dma_buffer_p;
+
+	u32 active_tasks;
+	u64 task_seqno;
+	struct list_head tasks;
 };
 
 /**
@@ -132,6 +153,12 @@ struct snd_compr_ops {
 			struct snd_compr_caps *caps);
 	int (*get_codec_caps) (struct snd_compr_stream *stream,
 			struct snd_compr_codec_caps *codec);
+#if IS_ENABLED(CONFIG_SND_COMPRESS_PASSTHROUGH)
+	int (*task_create) (struct snd_compr_stream *stream, struct snd_compr_task_runtime *task);
+	int (*task_start) (struct snd_compr_stream *stream, struct snd_compr_task_runtime *task);
+	int (*task_stop) (struct snd_compr_stream *stream, struct snd_compr_task_runtime *task);
+	int (*task_free) (struct snd_compr_stream *stream, struct snd_compr_task_runtime *task);
+#endif
 };
 
 /**
@@ -242,4 +269,9 @@ int snd_compr_free_pages(struct snd_compr_stream *stream);
 int snd_compr_stop_error(struct snd_compr_stream *stream,
 			 snd_pcm_state_t state);
 
+#if IS_ENABLED(CONFIG_SND_COMPRESS_PASSTHROUGH)
+void snd_compr_task_finished(struct snd_compr_stream *stream,
+			     struct snd_compr_task_runtime *task);
+#endif
+
 #endif
diff --git a/include/uapi/sound/compress_offload.h b/include/uapi/sound/compress_offload.h
index d185957f3fe0..f6cc721adeb2 100644
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
+	SND_COMPRESS_PASSTHROUGH
 };
 
 /**
@@ -127,6 +128,37 @@ struct snd_compr_metadata {
 	 __u32 value[8];
 } __attribute__((packed, aligned(4)));
 
+/**
+ * struct snd_compr_task - task primitive for non-realtime operation
+ * @seqno: sequence number (task identifier)
+ * @origin_seqno: previous sequence number (task identifier) - for reuse
+ * @input_fd: data input file descriptor (dma-buf)
+ * @output_fd: data output file descriptor (dma-buf)
+ * @input_size: filled data in bytes (from caller, must not exceed fragment size)
+ */
+struct snd_compr_task {
+	__u64 seqno;
+	__u64 origin_seqno;
+	int input_fd;
+	int output_fd;
+	__u64 input_size;
+	__u8 reserved[16];
+} __attribute__((packed, aligned(4)));
+
+/**
+ * struct snd_compr_task_status - task status
+ * @seqno: sequence number (task identifier)
+ * @output_size: filled data in bytes (from driver)
+ * @finished: non-zero means that the task was finished
+ */
+struct snd_compr_task_status {
+	__u64 seqno;
+	__u64 output_size;
+	__u8 active;
+	__u8 finished;
+	__u8 reserved[14];
+} __attribute__((packed, aligned(4)));
+
 /*
  * compress path ioctl definitions
  * SNDRV_COMPRESS_GET_CAPS: Query capability of DSP
@@ -164,6 +196,14 @@ struct snd_compr_metadata {
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
index 8077f481d84f..3541fe6d477f 100644
--- a/sound/core/Kconfig
+++ b/sound/core/Kconfig
@@ -59,6 +59,10 @@ config SND_CORE_TEST
 config SND_COMPRESS_OFFLOAD
 	tristate
 
+config SND_COMPRESS_PASSTHROUGH
+	select DMA_BUF
+	tristate
+
 config SND_JACK
 	bool
 
diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
index f0008fa2d839..47fb7c5ad564 100644
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
@@ -85,6 +86,8 @@ static int snd_compr_open(struct inode *inode, struct file *f)
 		dirn = SND_COMPRESS_PLAYBACK;
 	else if ((f->f_flags & O_ACCMODE) == O_RDONLY)
 		dirn = SND_COMPRESS_CAPTURE;
+	else if ((f->f_flags & O_ACCMODE) == O_RDWR)
+		dirn = SND_COMPRESS_PASSTHROUGH;
 	else
 		return -EINVAL;
 
@@ -226,6 +229,9 @@ snd_compr_ioctl_avail(struct snd_compr_stream *stream, unsigned long arg)
 	struct snd_compr_avail ioctl_avail;
 	size_t avail;
 
+	if (stream->direction == SND_COMPRESS_PASSTHROUGH)
+		return -EBADFD;
+
 	avail = snd_compr_calc_avail(stream, &ioctl_avail);
 	ioctl_avail.avail = avail;
 
@@ -287,6 +293,8 @@ static ssize_t snd_compr_write(struct file *f, const char __user *buf,
 		return -EFAULT;
 
 	stream = &data->stream;
+	if (stream->direction == SND_COMPRESS_PASSTHROUGH)
+		return -EBADFD;
 	guard(mutex)(&stream->device->lock);
 	/* write is allowed when stream is running or has been steup */
 	switch (stream->runtime->state) {
@@ -336,6 +344,8 @@ static ssize_t snd_compr_read(struct file *f, char __user *buf,
 		return -EFAULT;
 
 	stream = &data->stream;
+	if (stream->direction == SND_COMPRESS_PASSTHROUGH)
+		return -EBADFD;
 	guard(mutex)(&stream->device->lock);
 
 	/* read is allowed when stream is running, paused, draining and setup
@@ -385,6 +395,8 @@ static __poll_t snd_compr_poll(struct file *f, poll_table *wait)
 {
 	struct snd_compr_file *data = f->private_data;
 	struct snd_compr_stream *stream;
+	struct snd_compr_runtime *runtime;
+	struct snd_compr_task_runtime *task;
 	size_t avail;
 	__poll_t retval = 0;
 
@@ -392,6 +404,7 @@ static __poll_t snd_compr_poll(struct file *f, poll_table *wait)
 		return EPOLLERR;
 
 	stream = &data->stream;
+	runtime = stream->runtime;
 
 	guard(mutex)(&stream->device->lock);
 
@@ -405,6 +418,18 @@ static __poll_t snd_compr_poll(struct file *f, poll_table *wait)
 
 	poll_wait(f, &stream->runtime->sleep, wait);
 
+	if (stream->direction == SND_COMPRESS_PASSTHROUGH) {
+		if (runtime->fragments > runtime->active_tasks)
+			retval |= EPOLLOUT | EPOLLWRNORM;
+		task = list_first_entry_or_null(&runtime->tasks,
+						struct snd_compr_task_runtime,
+						list);
+		if (task && task->finished)
+			retval |= EPOLLIN | EPOLLRDNORM;
+		return retval;
+	}
+
+
 	avail = snd_compr_get_avail(stream);
 	pr_debug("avail is %ld\n", (unsigned long)avail);
 	/* check if we have at least one fragment to fill */
@@ -521,6 +546,9 @@ static int snd_compr_allocate_buffer(struct snd_compr_stream *stream,
 	unsigned int buffer_size;
 	void *buffer = NULL;
 
+	if (stream->direction == SND_COMPRESS_PASSTHROUGH)
+		goto params;
+
 	buffer_size = params->buffer.fragment_size * params->buffer.fragments;
 	if (stream->ops->copy) {
 		buffer = NULL;
@@ -543,18 +571,30 @@ static int snd_compr_allocate_buffer(struct snd_compr_stream *stream,
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
+	if (stream->direction == SND_COMPRESS_PASSTHROUGH)
+		max_fragments = 64;			/* safe value */
+	else
+		max_fragments = U32_MAX / params->buffer.fragment_size;
+
+	if (params->buffer.fragments > max_fragments ||
 	    params->buffer.fragments == 0)
 		return -EINVAL;
 
@@ -583,7 +623,7 @@ snd_compr_set_params(struct snd_compr_stream *stream, unsigned long arg)
 		if (IS_ERR(params))
 			return PTR_ERR(no_free_ptr(params));
 
-		retval = snd_compress_check_input(params);
+		retval = snd_compress_check_input(stream, params);
 		if (retval)
 			return retval;
 
@@ -939,6 +979,247 @@ static int snd_compr_partial_drain(struct snd_compr_stream *stream)
 	return snd_compress_wait_for_drain(stream);
 }
 
+#if IS_ENABLED(CONFIG_SND_COMPRESS_PASSTHROUGH)
+
+static struct snd_compr_task_runtime *
+		snd_compr_find_task(struct snd_compr_stream *stream, __u64 seqno)
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
+	if (utask->origin_seqno != 0 || utask->input_size != 0)
+		return -EINVAL;
+	if (snd_compr_find_task(stream, utask->seqno))
+		return -EALREADY;
+	task = kzalloc(sizeof(*task), GFP_KERNEL);
+	if (task == NULL)
+		return -ENOMEM;
+	task->seqno = snd_compr_seqno_next(stream);
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
+	list_add_tail(&task->list, &stream->runtime->tasks);
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
+	if (task->active)
+		return -EBUSY;
+	if (utask->input_size > task->input->size)
+		return -EINVAL;
+	task->input_size = utask->input_size;
+	task->finished = false;
+	return 0;
+}
+
+static int snd_compr_task_start(struct snd_compr_stream *stream, struct snd_compr_task *utask)
+{
+	struct snd_compr_task_runtime *task;
+	int retval;
+
+	if (utask->origin_seqno > 0) {
+		task = snd_compr_find_task(stream, utask->seqno);
+		retval = snd_compr_task_start_prepare(task, utask);
+		if (retval < 0)
+			return retval;
+		task->seqno = utask->seqno = snd_compr_seqno_next(stream);
+		utask->origin_seqno = 0;
+		list_move_tail(&task->list, &stream->runtime->tasks);
+	} else {
+		task = snd_compr_find_task(stream, utask->seqno);
+		if (task && task->finished)
+			return -EBUSY;
+		retval = snd_compr_task_start_prepare(task, utask);
+		if (retval < 0)
+			return retval;
+	}
+	retval = stream->ops->task_start(stream, task);
+	if (retval >= 0) {
+		task->active = true;
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
+	if (!task->finished)
+		stream->ops->task_stop(stream, task);
+	if (task->active) {
+		task->active = false;
+		if (!snd_BUG_ON(stream->runtime->active_tasks == 0))
+			stream->runtime->active_tasks--;
+		list_move_tail(&task->list, &stream->runtime->tasks);
+	}
+}
+
+static void snd_compr_task_free_one(struct snd_compr_stream *stream,
+					struct snd_compr_task_runtime *task)
+{
+	if (task->active)
+		snd_compr_task_stop_one(stream, task);
+	stream->ops->task_free(stream, task);
+	list_del(&task->list);
+	snd_compr_task_free(task);
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
+		list_for_each_entry(task, &stream->runtime->tasks, list)
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
+	status->output_size = task->output_size;
+	status->active = task->active ? 1 : 0;
+	status->finished = task->finished ? 1 : 0;
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
+	task->active = false;
+	task->finished = true;
+	wake_up(&stream->runtime->sleep);
+}
+EXPORT_SYMBOL(snd_compr_task_finished);
+
+#endif /* CONFIG_COMPRESS_PASSTHROUGH */
+
 static long snd_compr_ioctl(struct file *f, unsigned int cmd, unsigned long arg)
 {
 	struct snd_compr_file *data = f->private_data;
@@ -968,6 +1249,27 @@ static long snd_compr_ioctl(struct file *f, unsigned int cmd, unsigned long arg)
 		return snd_compr_set_metadata(stream, arg);
 	case _IOC_NR(SNDRV_COMPRESS_GET_METADATA):
 		return snd_compr_get_metadata(stream, arg);
+	}
+
+	if (stream->direction == SND_COMPRESS_PASSTHROUGH) {
+#if IS_ENABLED(CONFIG_SND_COMPRESS_PASSTHROUGH)
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
-- 
2.45.1

